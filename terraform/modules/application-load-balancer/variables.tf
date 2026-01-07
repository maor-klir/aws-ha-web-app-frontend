variable "aws_region" {
  description = "The AWS region to provision resources into"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "http_port" {
  description = "HTTP port number for EC2 ingress in security group"
  type        = number
  default     = 80
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the load balancer"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the load balancer will be deployed"
  type        = string
}
