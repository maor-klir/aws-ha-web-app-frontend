
variable "aws_region" {
  description = "The AWS region to provision resources into"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
}

variable "address_space" {
  description = "The CIDR block address space that is used by the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "azs_subnets" {
  description = "Availability Zones to use with subnets"
  type        = map(string)
}

variable "http_port" {
  description = "HTTP port number for EC2 ingress in security group"
  type        = number
  default     = 80
}

variable "inbound_ports" {
  description = "Allowed inbound ports numbers to supply to the security group"
  type        = list(any)
}

variable "allow_public_ips" {
  description = "Whether to allow the EC2 instances to have public IPs or not"
  type        = bool
  default     = false
}
