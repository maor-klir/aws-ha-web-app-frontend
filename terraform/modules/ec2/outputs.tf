
output "tags" {
  description = "Auto Scaling Group tags"
  value       = { for tag in aws_autoscaling_group.webserver.tag : values(tag)[0] => values(tag)[2] }
}
