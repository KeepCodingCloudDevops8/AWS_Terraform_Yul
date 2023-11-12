# Definición del Endpoint de salida del Terraform para acceder a la Web
output "website_endpoint" {
  value       = module.lb.endpoint_dns_lb
  description = "Devuelve el dns_name del LB para acceder a la Web"
}