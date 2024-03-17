# --- ECS Task Definition ---

resource "aws_ecs_task_definition" "app" {
  family             = "demo-app"
  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_exec_role.arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 256

  container_definitions = jsonencode([{
    name         = "app",
    image        = var.image,
    essential    = true,
    portMappings = [{ containerPort = 80, hostPort = 80 }],

    environment = [
      { name = "EXAMPLE", value = "example" }
    ]

    logConfiguration = {
      logDriver = "awslogs",
      options = {
        "awslogs-region"        = "us-east-2",
        "awslogs-group"         = aws_cloudwatch_log_group.ecs.name,
        "awslogs-stream-prefix" = "app"
      }
    },
  }])
}