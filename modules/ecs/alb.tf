# ALB

resource "aws_alb" "alb" {
  name                             = var.name
  internal                         = true
  security_groups                  = [aws_security_group.ecs_lb.id]
  subnets                          = data.aws_subnet_ids.alb.ids
  idle_timeout                     = var.alb_idle_timeout
  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = var.enable_http2

  tags = {
    service_name = var.name
  }
}


resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Path undefined in LB"
      status_code  = "404"
    }
  }
}


# resource "aws_alb_listener" "alb_ssl_listener" {
#    load_balancer_arn = aws_alb.alb.arn
#    port              = "443"
#    protocol          = "HTTPS"

#    ssl_policy      = "ELBSecurityPolicy-2015-05"
#    certificate_arn = var.acm_cert_arn

#    default_action {
#     type = "fixed-response"

#     fixed_response {
#       content_type = "text/plain"
#       message_body = "Path undefined in LB"
#       status_code  = "404"
#     }
#   }
#  }


data "aws_subnet_ids" "alb" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = [var.alb_subnet]
  }
}