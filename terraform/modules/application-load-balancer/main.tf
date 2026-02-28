resource "aws_lb" "demo-app" {
  name               = var.project_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demo-app-alb.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  tags = var.tags
}

resource "aws_lb_listener" "demo-app" {
  load_balancer_arn = aws_lb.demo-app.arn
  port              = var.http_port
  protocol          = "HTTP"

  default_action {
    fixed_response {
      content_type = "text/plain"
      message_body = "404 - Page Not Found"
      status_code  = 404
    }
    type = "fixed-response"
  }

  tags = var.tags
}

resource "aws_lb_listener_rule" "demo-app" {
  listener_arn = aws_lb_listener.demo-app.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.demo-app.arn
  }

  tags = var.tags
}

resource "aws_security_group" "demo-app-alb" {
  name   = "${var.project_name}-alb-sg"
  vpc_id = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all inbound traffic from the Internet on port 80"
    from_port   = var.http_port
    protocol    = "tcp"
    to_port     = var.http_port
  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }

  tags = var.tags
}

resource "aws_lb_target_group" "demo-app" {
  name                          = var.project_name
  load_balancing_algorithm_type = "least_outstanding_requests"
  port                          = var.http_port
  protocol                      = "HTTP"
  vpc_id                        = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = var.tags
}
