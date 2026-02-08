output "vpc_id_out" {
  value = aws_vpc.vpc.id
}

output "publice_subnet_id_out" {
  value = aws_subnet.public_subnet.*.id
}

output "public_subnet_cidr_out" {
  value = aws_subnet.public_subnet.*.cidr_block
}
