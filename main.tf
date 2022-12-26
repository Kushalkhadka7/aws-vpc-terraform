locals {
  tags = merge(module.label.tags, {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared" }
  )
}

# Create labels.
module "label" {
  source = "./modules/label"

  namespace  = "test"
  stage      = "dev"
  name       = var.vpc_name
  attributes = compact(concat([], ["Vpc"]))
  delimiter  = "-"

  tags = {
    "Name" = "default-vpc"
  }

}

# Create vpc.
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name

  tags = module.label.tags
}


# Creates subnets and associations.
module "subnets" {
  source = "./modules/subnets"

  vpc_cidr_block      = var.vpc_cidr
  vpc_id              = module.vpc.vpc_id
  no_of_nat_gateway   = var.no_of_nat_gateway
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  internet_gw_id      = module.vpc.internet_gateway_id

  tags = merge(local.tags, module.label.tags)
}
