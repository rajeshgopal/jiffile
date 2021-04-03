
module "ecs_service_role" {
  source  = "../iam_role"
  name    = "${var.name}-ecs"
  service = "ecs"
}

resource "aws_iam_role_policy_attachment" "policy_ecs_service" {
  policy_arn = aws_iam_policy.ecs_service_policy.arn
  role       = module.ecs_service_role.role_name
}

module "default_task_role" {
  source  = "../iam_role"
  name    = "${var.name}-default-task"
  service = "ecs-tasks"
}

resource "aws_iam_role_policy_attachment" "policy_ecs_task" {
  policy_arn = aws_iam_policy.ecs_task_policy.arn
  role       = module.default_task_role.role_name
}

module "task_execution_role" {
  source  = "../iam_role"
  name    = "${var.name}-task-execution"
  service = "ecs-tasks"
}

resource "aws_iam_role_policy_attachment" "policy_ecs_execution" {
  policy_arn = aws_iam_policy.ecs_execution_policy.arn
  role       = module.task_execution_role.role_name
}
