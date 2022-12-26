# Vpc output.
# ----------.
output "vpc_arn" {
  value       = module.vpc.vpc_arn
  description = "Arn of the vpc that is created"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of the vpc that is created"
}

output "main_route_table_id" {
  value       = module.vpc.main_route_table_id
  description = "Main route table id of the vpc that is created"
}

output "default_network_acl_id" {
  value       = module.vpc.default_network_acl_id
  description = "Default network acl id of the vpc that is created"
}

output "default_security_group_id" {
  value       = module.vpc.default_security_group_id
  description = "Default security group id  of the vpc that is created"
}

output "owner_id" {
  value       = module.vpc.owner_id
  description = "Owner id of the vpc that is created"
}

output "internet_gateway_id" {
  value       = module.vpc.internet_gateway_id
  description = "Internet gateway id attached to the VPC"
}

# ----------------------.
# Subnet related outputs.
# ----------------------.
output "availability_zones" {
  value       = module.subnets.availability_zones
  description = "All availability zones in the current region"
}

output "public_subnet_id" {
  value       = module.subnets.public_subnet_id
  description = "Public subnet id"
}

output "public_subnet_arn" {
  value       = module.subnets.public_subnet_arn
  description = "Public subnet arn"
}

output "private_subnet_id" {
  value       = module.subnets.private_subnet_id
  description = "Private subnet id"
}

output "private_subnet_arn" {
  value       = module.subnets.private_subnet_arn
  description = "Public subnet arn"
}


output "nat_gateway" {
  value       = module.subnets.nat_gateway
  description = "Nat gateway credentials"
}

output "elastic_ip" {
  value       = module.subnets.elastic_ip
  description = "Elastic ip info"
}
