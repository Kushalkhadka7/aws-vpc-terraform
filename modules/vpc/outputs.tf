
output "default_vpc" {
  value       = aws_vpc.default
  description = "Vpc output credentials"
}


output "internet_gateway_id" {
  value       = aws_internet_gateway.ig.id
  description = "Vpc output credentials"
}
