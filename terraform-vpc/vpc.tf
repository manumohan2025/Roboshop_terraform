resource "aws_vpc1" "main" {
  cidr_block = var.VPC_CIDR
  enable_dns_support        = true
  enable_dns_hostnames      = true
  tags       = {
    Name         = "${var.PROJECT_NAME}--${var.ENV}--vpc"
    Environment  = var.ENV
    Provisioning = "Terraform"
  }
}

resource "aws_subnet" "private-subnet" {
  count         = 2
  cidr_block    = cidrsubnet(var.VPC_CIDR,2, count.index)
  vpc_id        = aws_vpc1.main.id
  tags       = {
    Name         = "${var.PROJECT_NAME}--${var.ENV}--vpc"
    Environment  = var.ENV
    Provisioning = "Terraform"
  }

}

resource "aws_subnet" "public-subnet" {
  count         = 2
  cidr_block    = cidrsubnet(var.VPC_CIDR,2, count.index+2)
  vpc_id        = aws_vpc1.main.id
  tags       = {
    Name         = "${var.PROJECT_NAME}--${var.ENV}--vpc"
    Environment  = var.ENV
    Provisioning = "Terraform"
  }
}