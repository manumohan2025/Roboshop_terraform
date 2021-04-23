output "PUBLIC_SUBNETS" {
  value = aws_subnet.public-subnet.*.id
}
output "PRIVATE_SUBNETS" {
  value = aws_subnet.private-subnet.*.id
}