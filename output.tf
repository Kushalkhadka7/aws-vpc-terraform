# Vpc output.
# ----------.
output "vpc" {
  value       = module.vpc.default_vpc
  description = "Vpc output credentials"
}

output "availability_zones" {
  value       = module.subnets.availability_zones
  description = "Availability zones"
}

# Subnet outputs.
# --------------.

output "public_subnet" {
  value       = module.subnets.public_subnet
  description = "Public subnet credentials"
}

output "private_subnet" {
  value       = module.subnets.private_subnet
  description = "Private subnet credentials"
}


output "nat_gateway" {
  value       = module.subnets.nat_gateway
  description = "Nat gateway credentials"
}


output "elastic_ip" {
  value       = module.subnets.elastic_ip
  description = "Elastic ip info"
}
