################################################################################
# Variables para el recurso VPC
################################################################################

# Definición del nombre para los recursos
variable "app_name" {
  description = "Nombre para el recurso"
  type        = string
}

variable "cidr_block_vpc" {
  description = "Bloque CIDR"
  type        = string
  default     = "10.0.0.0/16"
}
variable "cidr_block_pub" {
  description = "Segmentos de redes publicas"
  type        = list(string)
  default     = ["10.0.96.0/19", "10.0.128.0/19", "10.0.160.0/19"]
}
variable "enable_dns_support" {
  description = "Soporte DNS"
  type        = bool
  default     = true
}
variable "enable_dns_hostnames" {
  description = "Activar DNS Hostname"
  type        = bool
  default     = true
}
# Variable para asignar IP Subnet Pub
variable "map_public_ip_on_launch" {
  type    = bool
  default = false
}

variable "table_cidr_block" {
  description = "CIDR block destino"
  type        = string
  default     = "0.0.0.0/0"
}