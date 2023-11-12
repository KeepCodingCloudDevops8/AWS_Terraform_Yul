################################################################################
# Variables para el recurso SG
################################################################################

# Definición del nombre para los recursos
variable "app_name" {
  description = "Nombre para el recurso"
  type        = string
}
# Variables en comun para ingrees & egress
variable "cidr_blocks" {
  description = "Lista de bloques CIDR"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
# Variables para el SG
variable "vpc" {
  description = "Referencia d la VPC"
  type        = string
}
# Variables dedicadas a ingrees
variable "port" {
  description = "Puerto de escucha para el SG"
  type        = number
  default     = 80
}
variable "protocol" {
  description = "Protocolo de escucha para el SG"
  type        = string
  default     = "tcp"
}
variable "ingress_description" {
  description = "Descripción de regla de entrada"
  type        = string
  default     = "All HTTP traffic"
}
# Variables dedicadas a egrees
variable "egress_description" {
  description = "Descripción de regla de salida"
  type        = string
  default     = "Allow all outbound traffic"
}
variable "egress_from_port" {
  description = "Puerto para regla de salida"
  type        = number
  default     = 0
}
variable "egress_protocol" {
  description = "Protocolo para regla de salida"
  type        = string
  default     = "-1"
}
