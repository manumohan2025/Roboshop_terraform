resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  route {
    cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags       = {
    Name         = "${var.PROJECT_NAME}--${var.ENV}--vpc"
    Environment  = var.ENV
    Provisioning = "Terraform"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc1.main.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  }

  tags       = {
    Name         = "${var.PROJECT_NAME}--${var.ENV}--vpc"
    Environment  = var.ENV
    Provisioning = "Terraform"
  }
}
resource "aws_route_table_association" "public" {
  count          = 2
  subnet_id      = element(aws_subnet.public-subnet,*,id,count.index )
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  count          = 2
  subnet_id      = element(aws_subnet.private-subnet,*,id,count.index )
  route_table_id = aws_route_table.private.id
}