################################################################################
# Variables para el recurso LB
################################################################################

# Definición del nombre para los recursos
variable "app_name" {
  description = "Nombre para el recurso"
  type        = string
}
# Variables para el recurso LB
variable "internal" {
  description = "Define si el LB es interno o externo"
  type        = bool
  default     = false
}
variable "load_balancer_type" {
  description = "Tipo de LB"
  type        = string
  default     = "application"
}
variable "security_groups" {
  description = "Lista de Security Groups del LB"
  type        = list(any)
  default     = []
}
variable "subnets" {
  description = "Lista de Subredes"
  type        = list(any)
  default     = []
}
variable "deletion_protection" {
  description = "Habilita o deshabilita la protección contra la eliminación"
  type        = bool
  default     = false
}
# Variables compartidas para el Listener y el Target Group del LB
variable "protocol" {
  description = "Protocolo de escucha"
  type        = string
  default     = "HTTP"
}
variable "port" {
  description = "Puerto de escucha"
  type        = number
  default     = 80
}
# Variables para el Listener del LB
variable "type" {
  description = "Tipo de acción del LB Listener"
  type        = string
  default     = "forward"
}
# Variables para el Target Goroup del LB
variable "vpc" {
  description = "VPC para el Target Group"
  type        = string
}
variable "target_type" {
  description = "Tipo de Target Group"
  type        = string
  default     = "ip"
}
variable "path" {
  description = "Ruta"
  type        = string
  default     = "/"
}
variable "timeout" {
  description = "Tiempo de espera de comprobación"
  type        = number
  default     = 5
}
variable "interval" {
  description = "Intervalo entre comprobaciones"
  type        = number
  default     = 30
}
variable "healthy_threshold" {
  description = "Número de exitos consecutivos correctos para considerar que el objetivo es sano"
  type        = number
  default     = 3
}
variable "unhealthy_threshold" {
  description = "Número de fallos consecutivos incorrectos para considerar que el objetivo no es sano"
  type        = number
  default     = 3
}