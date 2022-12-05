output "public_subnet" {
  value       = aws_subnet.public_subnet
  description = "Public subnet credentials"
}

output "private_subnet" {
  value       = aws_subnet.private_subnet
  description = "Private subnet credentials"
}


output "nat_gateway" {
  value       = aws_nat_gateway.this
  description = "Nat gateway credentials"
}


output "elastic_ip" {
  value       = aws_eip.this
  description = "Elastic ip info"
}

output "availability_zones" {
  value       = data.aws_availability_zones.available
  description = "Availability zones"
}
