################################################################################
# Load Balancer
################################################################################

# Definición del LB
resource "aws_lb" "this" {
  name               = "${var.app_name}-lb-app"
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.deletion_protection

  tags = {
    Name = "${var.app_name}-lb-app"
  }
}
# Definición del listener para el LB
resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  protocol          = var.protocol
  port              = var.port

  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type             = var.type
  }
}
# Definición del Target Group para el LB
resource "aws_lb_target_group" "this" {
  name        = "${var.app_name}-tg-lb"
  protocol    = var.protocol
  port        = var.port
  vpc_id      = var.vpc
  target_type = var.target_type

  health_check {
    path                = var.path
    timeout             = var.timeout
    protocol            = var.protocol
    port                = var.port
    interval            = var.interval
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }
  tags = {
    Name = "${var.app_name}-tg-lb"
  }
}