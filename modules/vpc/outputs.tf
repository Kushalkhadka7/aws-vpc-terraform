output "vpc_arn" {
  value       = aws_vpc.this.arn
  description = "Arn of the vpc that is created"
}

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "ID of the vpc that is created"
}

output "main_route_table_id" {
  value       = aws_vpc.this.main_route_table_id
  description = "Main route table id of the vpc that is created"
}

output "default_network_acl_id" {
  value       = aws_vpc.this.default_network_acl_id
  description = "Default network acl id of the vpc that is created"
}

output "default_security_group_id" {
  value       = aws_vpc.this.default_security_group_id
  description = "Default security group id  of the vpc that is created"
}

output "owner_id" {
  value       = aws_vpc.this.owner_id
  description = "Owner id of the vpc that is created"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "Internet gateway id attached to the VPC"
}
