resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "application-load-balancer" {
  source  = "app.terraform.io/maor/terraform-aws-application-load-balancer/aws"
  version = "0.2.0"

  project_name = var.project_name
  aws_region   = var.aws_region
  vpc_id       = module.networking.vpc_id
  http_port    = var.http_port
  https_port   = var.https_port
  subnet_ids   = module.networking.subnet_ids
  tags         = local.tags
}

module "networking" {
  source  = "app.terraform.io/maor/terraform-aws-networking/aws"
  version = "0.1.0"

  aws_region       = var.aws_region
  project_name     = var.project_name
  address_space    = var.address_space
  azs_subnets      = var.azs_subnets
  http_port        = var.http_port
  inbound_ports    = local.inbound_ports
  allow_public_ips = var.allow_public_ips
  tags             = local.tags
}

module "ec2" {
  source  = "app.terraform.io/maor/terraform-aws-ec2/aws"
  version = "0.2.0"

  aws_region          = var.aws_region
  ec2_instance_type   = var.ec2_instance_type
  aws_key_name        = var.aws_key_name
  public_key          = tls_private_key.my_key.public_key_openssh
  user_data           = local.user_data
  demo_app_sg_id      = module.networking.security_group_id
  demo_app_subnet_ids = module.networking.subnet_ids
  target_group_arns   = [module.application-load-balancer.target_group_arn]
  tags                = local.tags
}
