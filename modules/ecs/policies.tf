############
#  Policy  #
############

resource "aws_iam_policy" "ecs_service_policy" {
  name        = "${var.name}-ecs"
  path        = "/"
  description = "Policy for ECS Service"
  policy      = data.template_file.ecs_service_policy.rendered
}

data "template_file" "ecs_service_policy" {
  template = file("${path.module}/templates/ecs_service_policy.json.tpl")
}

resource "aws_iam_policy" "ecs_task_policy" {
  name        = "${var.name}-task"
  path        = "/"
  description = "Policy for ECS Tasks"
  policy      = data.template_file.ecs_task_policy.rendered
}

data "template_file" "ecs_task_policy" {
  template = file("${path.module}/templates/ecs_task_policy.json.tpl")
}

resource "aws_iam_policy" "ecs_execution_policy" {
  name        = "${var.name}-execution"
  path        = "/"
  description = "Policy for ECS execution Tasks"
  policy      = data.template_file.ecs_task_execution_policy.rendered
}

data "template_file" "ecs_task_execution_policy" {
  template = file("${path.module}/templates/ecs_task_execution_policy.json.tpl")
}
