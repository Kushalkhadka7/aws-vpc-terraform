# Create vpc.
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}


# Creates subnets and associations.
module "subnets" {
  source = "./modules/subnets"

  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  vpc_id              = module.vpc.default_vpc.id
  internet_gw_id      = module.vpc.internet_gateway_id
}
