################################################################################
# VPC
################################################################################

# Definición del recurso VPC
resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block_vpc
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "${var.app_name}-vpc"
  }
}
# Subnet VPC
resource "aws_subnet" "this" {
  count             = length(var.cidr_block_pub)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.cidr_block_pub, count.index)
  availability_zone = element(local.aws_availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = {
    Name = "${var.app_name}-subnet-public${count.index}"
  }
}
# VPC Table Route
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = var.table_cidr_block
    gateway_id = aws_internet_gateway.this.id
  }
  tags = {
    Name = "${var.app_name}-route-table"
  }
}
# Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.app_name}-gateway"
  }
}
# Asociamos, al VPC main, la tabla de rutas
resource "aws_main_route_table_association" "this" {
  vpc_id         = aws_vpc.this.id
  route_table_id = aws_route_table.this.id
}