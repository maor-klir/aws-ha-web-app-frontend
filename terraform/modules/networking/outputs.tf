output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.demo-app.id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = [for subnet in aws_subnet.demo-app : subnet.id]
}

output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.demo-app.id
}
