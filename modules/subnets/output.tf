output "public_subnet" {
  value       = aws_subnet.public_subnet
  description = "Public subnet credentials"
}

output "private_subnet" {
  value       = aws_subnet.private_subnet
  description = "Private subnet credentials"
}


output "nat_gateway" {
  value       = aws_nat_gateway.nat_gw
  description = "Nat gateway credentials"
}


output "elastic_ip" {
  value       = aws_eip.elastic_ip
  description = "Elastic ip info"
}
