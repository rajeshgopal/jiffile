## ECS Cluster
output "aws_ecs_cluster_name" {
  description = "The name of the cluster"
  value       = aws_ecs_cluster.cluster.name
}

output "aws_ecs_cluster_cluster_id" {
  description = "The Amazon ID that identifies the cluster"
  value       = aws_ecs_cluster.cluster.id
}

output "aws_ecs_cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster"
  value       = aws_ecs_cluster.cluster.arn
}

## ALB
output "aws_lb_id" {
  description = "The ARN of the load balancer (matches arn)."
  value       = aws_alb.alb.id
}

output "aws_lb_arn" {
  description = "The ARN of the load balancer (matches id)."
  value       = aws_alb.alb.arn
}

output "aws_lb_arn_suffix" {
  description = "The ARN suffix for use with CloudWatch Metrics."
  value       = aws_alb.alb.arn_suffix
}

output "aws_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_alb.alb.dns_name
}

output "aws_lb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = aws_alb.alb.zone_id
}

### ALB Listener
output "lb_http_listener_id" {
  description = "HTTP Listener ID"
  value       = aws_alb_listener.alb_listener.id
}

#output "lb_https_listener_arn" {
#  description = "HTTPS Listener ARN"
#  value       = aws_alb_listener.alb_ssl_listener.arn
#}

### IAM Roles

output "ecs_service_role" {
  description = "ECS Service IAM role"
  value       = module.ecs_service_role.arn
}

output "ecs_task_role" {
  description = "ECS Service Task IAM role"
  value       = module.default_task_role.arn
}

output "ecs_execution_role" {
  description = "ECS Service Task Execution IAM role"
  value       = module.task_execution_role.arn
}

### Security Groups

output "ecs_security_group" {
  description = "Security group for ECS services"
  value       = aws_security_group.ecs_service.id
}

output "lb_security_group" {
  description = "Security group for LB"
  value       = aws_security_group.ecs_lb.id
}