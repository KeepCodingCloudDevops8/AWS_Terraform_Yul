################################################################################
# ECS Cluster
################################################################################

# Definición del ECS Cluster  
resource "aws_ecs_cluster" "this" {
  name = "${var.app_name}-cluster"
  tags = {
    Name = "${var.app_name}-cluster"
  }
}

# Definición del ECS Task Definition
resource "aws_ecs_task_definition" "this" {
  family                   = "${var.app_name}-task"
  network_mode             = var.network_mode
  requires_compatibilities = var.requires_compatibilities
  cpu                      = var.cpu
  memory                   = var.memory

  container_definitions = jsonencode([ # Definición del contenedor
    {
      name      = "${var.app_name}-container-ECS"
      image     = var.image
      cpu       = var.cpu
      memory    = var.memory
      essential = var.essential
      portMappings = [
        {
          containerPort = var.port
          hostPort      = var.port
        },
      ],
    },
  ])
  tags = {
    Name = "${var.app_name}-task"
  }
}

# Definición del ECS Service
resource "aws_ecs_service" "this" {
  name             = "${var.app_name}-service-ECS"
  cluster          = aws_ecs_cluster.this.id
  task_definition  = aws_ecs_task_definition.this.id
  desired_count    = var.desired_count
  launch_type      = var.launch_type
  platform_version = var.platform_version

  network_configuration { # Definición la red a nivel de task
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
    subnets          = var.subnets
  }

  load_balancer { # Definición LB a nivel de task
    target_group_arn = var.target_group_arn
    container_name   = "${var.app_name}-container-ECS"
    container_port   = var.port
  }
  tags = {
    Name = "${var.app_name}-service-ECS"
  }
}