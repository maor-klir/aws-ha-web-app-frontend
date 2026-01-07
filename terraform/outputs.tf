output "private_key" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}

output "alb_fqdn" {
  value       = aws_lb.demo-app.dns_name
  description = "The application load balancer FQDN"
}

output "tags" {
  value       = { for tag in aws_autoscaling_group.webserver.tag : values(tag)[0] => values(tag)[2] }
  description = "Auto Scaling Group tags"
}
