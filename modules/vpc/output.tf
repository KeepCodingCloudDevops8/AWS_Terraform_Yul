################################################################################
# VPC output
################################################################################

output "vpc_id" {
  description = "Devuelve el ID de la VPC creada"
  value       = aws_vpc.this.id
}
output "subnets_ids" {
  value       = aws_subnet.this.*.id
  description = "Devuelve el ID de las Subnets creadas"
}