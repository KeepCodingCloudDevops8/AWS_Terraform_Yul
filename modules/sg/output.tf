################################################################################
# VPC output
################################################################################

output "id_security_groups" {
  value       = aws_security_group.this.*.id
  description = "Devuelve el ID de los Security Groups creados"
}