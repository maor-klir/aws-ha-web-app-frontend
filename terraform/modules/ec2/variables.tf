variable "aws_region" {
  description = "The AWS region to provision resources into"
  type        = string
  default     = "eu-central-1"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "aws_key_name" {
  description = "AWS key name to SSH into the EC2 instances"
  type        = string
}

variable "public_key" {
  description = "Public key material to create the AWS key pair"
  type        = string
}
variable "user_data" {
  description = "User data script path to initialize EC2 instances"
  type        = string
}

variable "demo_app_sg_id" {
  description = "Security Group ID for the demo app EC2 instances"
  type        = string
}

variable "demo_app_subnet_ids" {
  description = "Subnet IDs for the demo-app"
  type        = list(string)
}

variable "target_group_arns" {
  description = "Target group ARN for the demo app EC2 instances"
  type        = set(string)
}

variable "tags" {
  description = "A merge of user defined tags and resource tags"
  type        = map(string)
  default     = {}
}
