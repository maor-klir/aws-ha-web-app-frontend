resource "aws_vpc" "demo-app" {
  cidr_block           = var.address_space
  enable_dns_hostnames = true

  tags = local.tags
}

resource "aws_subnet" "demo-app" {
  for_each = var.azs_subnets

  vpc_id                  = aws_vpc.demo-app.id
  availability_zone       = each.key
  cidr_block              = each.value
  map_public_ip_on_launch = var.allow_public_ips

  tags = local.tags
}

resource "aws_security_group" "demo-app" {
  name   = "${var.project_name}-sg"
  vpc_id = aws_vpc.demo-app.id

  dynamic "ingress" {
    for_each = local.inbound_ports

    content {
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value == var.http_port ? "HTTP Ingress" : "SSH Ingress"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.tags
}

resource "aws_internet_gateway" "demo-app" {
  vpc_id = aws_vpc.demo-app.id

  tags = local.tags
}

resource "aws_route_table" "demo-app" {
  vpc_id = aws_vpc.demo-app.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-app.id
  }

  tags = local.tags
}

resource "aws_route_table_association" "demo-app" {
  for_each = var.azs_subnets

  subnet_id      = aws_subnet.demo-app[each.key].id
  route_table_id = aws_route_table.demo-app.id
}

# resource "aws_eip" "webserver" {
#   instance = aws_instance.webserver.id
#   vpc      = true

#   tags = local.tags
# }

# resource "aws_eip_association" "webserver" {
#   instance_id   = aws_instance.webserver.id
#   allocation_id = aws_eip.webserver.id
# }
