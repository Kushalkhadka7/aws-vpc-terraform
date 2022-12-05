output "default_vpc" {
  value       = aws_vpc.this
  description = "Vpc output credentials"
}


output "internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "Vpc output credentials"
}
