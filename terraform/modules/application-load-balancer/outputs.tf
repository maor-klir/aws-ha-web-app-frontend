output "alb_fqdn" {
  description = "The application load balancer FQDN"
  value       = aws_lb.demo-app.dns_name
}

output "target_group_arn" {
  description = "The application load balancer target group ARN"
  value       = aws_lb_target_group.demo-app.arn
}
