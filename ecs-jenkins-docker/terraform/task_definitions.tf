resource "aws_ecs_task_definition" "backend" {
  family                   = "backend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_exec.arn

  container_definitions = jsonencode([
    {
      name      = "backend"
      image     = "468998844443.dkr.ecr.us-east-1.amazonaws.com/lightfeatherlightbackend:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8080
        }
      ]
    }
  ])
}

resource "aws_ecs_task_definition" "frontend" {
  family                   = "frontend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_exec.arn

  container_definitions = jsonencode([
    {
      name      = "frontend"
      image     = "468998844443.dkr.ecr.us-east-1.amazonaws.com/lightfeatherfrontend:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
        }
      ]
    }
  ])
}
