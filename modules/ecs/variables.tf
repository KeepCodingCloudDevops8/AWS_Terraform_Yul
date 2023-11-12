################################################################################
# Variables para el módulo ECS
################################################################################

# Definición del nombre para los recursos
variable "app_name" {
  description = "Nombre para el recurso"
  type        = string
}
# Definición de variables para ECS Task Definition
variable "network_mode" {
  description = "Tipo de networking"
  type        = string
  default     = "awsvpc"
}
variable "requires_compatibilities" {
  description = "Tipo de lanzamiento"
  type        = list(string)
  default     = ["FARGATE"]
}
# Definición de variables para el contenedor
variable "image" {
  description = "Imagen del contenedor"
  type        = string
}
variable "cpu" {
  description = "CPU"
  type        = number
  default     = 512
}
variable "memory" {
  description = "Memoria"
  type        = number
  default     = 1024
}
variable "essential" {
  description = "Parametro para marcar si un contenedor en esencial"
  type        = bool
  default     = true
}
variable "port" {
  description = "Puerto"
  type        = number
  default     = 80
}
# Definición de variables para el ECS Service
variable "desired_count" {
  description = "Número de tasks que se ejecutaran"
  type        = number
  default     = 2
}
variable "launch_type" {
  description = "Tipo de lanzamiento"
  type        = string
  default     = "FARGATE"
}
variable "platform_version" {
  description = "Versión de la plataforma de ECS"
  type        = string
  default     = "LATEST"
}
# Definición de variables de Network para el ECS Service
variable "assign_public_ip" {
  description = "Asignación de una IP pública"
  type        = bool
  default     = true
}
variable "security_groups" {
  description = "Lista de Security Groups"
  type        = list(any)
  default     = []
}
variable "subnets" {
  description = "Lista de Subnets"
  type        = list(any)
  default     = []
}
# Definición de variables de LB para el ECS Service
variable "target_group_arn" {
  description = "ARN del Target Group"
  type        = string
}