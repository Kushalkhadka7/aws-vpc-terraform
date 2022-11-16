module "aws_vpc" {
  source              = "./vpc"
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  public_subnet_name  = var.public_subnet_name
  private_subnet_cidr = var.private_subnet_cidr
  private_subnet_name = var.private_subnet_name
  private_route_cidr  = var.private_route_cidr
  public_route_cidr   = var.public_route_cidr
}
