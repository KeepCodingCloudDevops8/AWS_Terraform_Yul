################################################################################
# ROOT MODULE 
################################################################################

################################################################################
# LB Module
################################################################################

module "lb" {
  source = "../modules/lb"

  app_name            = var.app_name
  vpc                 = module.vpc.vpc_id
  security_groups     = module.sg.id_security_groups
  subnets             = module.vpc.subnets_ids
  port                = 80
  protocol            = "HTTP"
  target_type         = "ip"
  path                = "/"
  timeout             = 5
  interval            = 20
  healthy_threshold   = 2
  unhealthy_threshold = 2
  type                = "forward"

}

################################################################################
# SG Module
################################################################################

module "sg" {
  source = "../modules/sg"

  app_name    = var.app_name
  vpc         = module.vpc.vpc_id
  port        = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../modules/vpc"

  app_name                = var.app_name
  cidr_block_vpc          = "10.0.0.0/16"
  map_public_ip_on_launch = true
  table_cidr_block        = "0.0.0.0/0"
}

################################################################################
# ECS Module
################################################################################

module "ecs" {
  source = "../modules/ecs"
  # Datos del módulo
  app_name         = var.app_name
  image            = "nginx:latest"
  port             = 80
  desired_count    = 2
  cpu              = 512
  memory           = 1024
  subnets          = module.vpc.subnets_ids
  security_groups  = module.sg.id_security_groups
  target_group_arn = module.lb.target_group_arn
}