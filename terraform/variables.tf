variable "aws_region" {
  type        = string
  description = "The AWS region to provision resources into"
  default     = "eu-central-1"
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "aws_key" {
  type        = string
  description = "AWS key to SSH into the EC2 instances"
  default     = "aws_key.pem"
}

variable "ssh_port" {
  type        = number
  description = "SSH port number for EC2 ingress in security group."
  default     = 22
  validation {
    condition     = var.ssh_port == 22
    error_message = "SSH Port has to be port 22."
  }
}

variable "http_port" {
  type        = number
  description = "HTTP port number for EC2 ingress in security group"
  default     = 80
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "demo-app"
}

variable "environment_name" {
  description = "Name of the environment"
  type        = string
  default     = "dev"
}

variable "resource_tags" {
  description = "User defined tags to set for all resources"
  type        = map(string)
  default     = {}
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = string
  default     = "10.1.0.0/16"
}

variable "allow_public_ips" {
  description = "Whether to allow the EC2 instances to have public IPs or not"
  type        = bool
  default     = false
}

variable "azs_subnets" {
  type        = map(string)
  description = "Availability Zones to use with subnets"
  default = {
    "eu-central-1a" = "10.1.1.0/24",
    "eu-central-1b" = "10.1.2.0/24",
    "eu-central-1c" = "10.1.3.0/24"
  }
}

variable "display_version" {
  description = "A boolean to decide whether to display the version of the demo-app"
  type        = bool
  default     = true
}

variable "app_version" {
  description = "The version of the demo-app"
  type        = string
}
