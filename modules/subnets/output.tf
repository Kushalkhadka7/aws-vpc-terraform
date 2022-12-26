output "availability_zones" {
  value       = data.aws_availability_zones.available
  description = "All availability zones in the current region"
}

output "public_subnet_id" {
  value       = join("", aws_subnet.public_subnet.*.id)
  description = "Public subnet id"
}

output "public_subnet_arn" {
  value       = join("", aws_subnet.public_subnet.*.id)
  description = "Public subnet arn"
}

output "private_subnet_id" {
  value       = join("", aws_subnet.private_subnet.*.id)
  description = "Private subnet id"
}

output "private_subnet_arn" {
  value       = join("", aws_subnet.private_subnet.*.id)
  description = "Public subnet arn"
}


output "nat_gateway" {
  value       = aws_nat_gateway.this
  description = "Nat gateway credentials"
}

output "elastic_ip" {
  value       = aws_eip.this
  description = "Elastic ip info"
}
