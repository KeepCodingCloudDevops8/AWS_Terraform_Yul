
################################################################################
# Security Gorup
################################################################################

# Definición del SG
resource "aws_security_group" "this" {
  name   = "${var.app_name}-sg"
  vpc_id = var.vpc
  ingress { # Reglas de entrada
    from_port   = var.port
    to_port     = var.port
    protocol    = var.protocol
    cidr_blocks = var.cidr_blocks
    description = var.ingress_description
  }
  egress { # Reglas de salida
    from_port   = var.egress_from_port
    to_port     = var.egress_from_port
    protocol    = var.egress_protocol
    cidr_blocks = var.cidr_blocks
    description = var.egress_description
  }
  tags = {
    Name = "${var.app_name}-sg"
  }
}
