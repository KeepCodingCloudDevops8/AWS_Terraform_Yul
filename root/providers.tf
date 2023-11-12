# Definición de la versión de Terraform que vamos a utilizar
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
# Definición del proveedor para AWS
provider "aws" {
  region = "eu-west-1"
}