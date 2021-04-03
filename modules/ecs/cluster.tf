#############
#  ECS Cluster  #
#############

resource "aws_ecs_cluster" "cluster" {
  name               = "${var.name}-services"
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
    base              = 1
  }
}

