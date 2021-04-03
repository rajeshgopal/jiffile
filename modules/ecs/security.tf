# ecs-internal - allow standard HTTP(S) to ECS cluster services from VPC

resource "aws_security_group" "ecs_service" {
  name        = "${var.name}-ecs-service"
  vpc_id      = var.vpc_id
  description = "Allow standard HTTP(S) to ECS cluster services from VPC"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    self      = true
  }

  ingress {
    from_port       = 8000
    to_port         = 9000
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_lb.id]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_lb.id]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_lb.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-ecs-service"
  }
}

resource "aws_security_group" "ecs_lb" {
  name        = "${var.name}-ecs-lb"
  vpc_id      = var.vpc_id
  description = "Allow standard HTTP(S) to LB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-ecs-lb"
  }
}
