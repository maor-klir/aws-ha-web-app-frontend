# Explicitly set variables (although they have defaults in variables.tf)

aws_region        = "eu-central-1"
ec2_instance_type = "t3.micro"

ssh_port  = 22
http_port = 80

resource_tags = {
  department     = "engineering"
  developer_name = "maor"
}

allow_public_ips = true

display_version = true
app_version     = "1.0.0"
