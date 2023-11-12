################################################################################
# LB output
################################################################################

output "target_group_arn" {
  value       = aws_lb_target_group.this.arn
  description = "Devuelve el ARN del target group"
}
output "endpoint_dns_lb" {
  value       = aws_lb.this.dns_name
  description = "Devuelve el dns_name del LB para poder acceder a la aplicación web"
}