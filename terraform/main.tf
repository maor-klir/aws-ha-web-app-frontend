resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "mykey" {
  key_name   = var.aws_key
  public_key = tls_private_key.mykey.public_key_openssh
}

resource "aws_launch_template" "webserver" {
  name_prefix   = "demo-app-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  key_name      = aws_key_pair.mykey.key_name
  user_data     = base64encode(local.user_data)

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.demo-app.id]
  }
}

resource "aws_autoscaling_group" "webserver" {

  launch_template {
    id      = aws_launch_template.webserver.id
    version = "$Latest"
  }

  vpc_zone_identifier = [for subnet in aws_subnet.demo-app : subnet.id]
  min_size            = 2
  max_size            = 3
  desired_capacity    = 3

  target_group_arns         = [aws_lb_target_group.demo-app.arn]
  health_check_type         = "ELB" # uses the load balancer / target-group health checks instead of basic EC2 instance status checks
  health_check_grace_period = 300   # adequate for medium boot time (180-300 seconds) - apt installs, small setup script

  dynamic "tag" {
    for_each = local.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
