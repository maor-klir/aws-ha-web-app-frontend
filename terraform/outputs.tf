output "private_key" {
  description = "Private SSH key to access the EC2 instances"
  value       = tls_private_key.my_key.private_key_pem
  sensitive   = true
}

output "alb_fqdn" {
  description = "The application load balancer FQDN"
  value       = module.application-load-balancer.alb_fqdn
}

output "tags" {
  description = "Auto Scaling Group tags"
  value       = module.ec2.tags
}
