# Create vpc.
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}


module "subnets" {
  source = "./modules/subnets"

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  vpc_id              = module.vpc.default_vpc.id
  internet_gw_id      = module.vpc.internet_gateway_id
  availability_zones  = data.aws_availability_zones.available.names
}
