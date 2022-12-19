locals {
  availability_zone_count = length(data.aws_availability_zones.available.names)

  no_of_public_subnet  = var.public_subnet_count > 0 && var.public_subnet_count < local.availability_zone_count ? var.public_subnet_count : local.availability_zone_count
  no_of_private_subnet = var.private_subnet_count > 0 && var.private_subnet_count < local.availability_zone_count ? var.private_subnet_count : local.availability_zone_count

  no_of_nat_gw = local.no_of_public_subnet
}

# Creates private subnet across the no of availability zones.
# Eg. If the region have 3 AZ, 3 private subnets will be created.
resource "aws_subnet" "private_subnet" {
  map_public_ip_on_launch = false
  vpc_id                  = var.vpc_id
  count                   = local.no_of_private_subnet
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  cidr_block = cidrsubnet(
    signum(length(var.private_subnet_cidr)) == 1 ? var.private_subnet_cidr : var.vpc_cidr_block,
    ceil(log(local.no_of_private_subnet * 2, 2)),
    count.index
  )


  tags = {
    type                                        = "Private"
    Vpv                                         = var.vpc_id
    Name                                        = format("Private_subnet_%s", data.aws_availability_zones.available.names[count.index]),
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.cluster_name}" = "owned"
  }
}

# Creates public subnet across the no of availability zones.
# Eg. If the region have 3 AZ, 3 pubilc subnets will be created.
resource "aws_subnet" "public_subnet" {
  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id
  count                   = local.no_of_public_subnet
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  cidr_block = cidrsubnet(
    signum(length(var.public_subnet_cidr)) == 1 ? var.public_subnet_cidr : var.vpc_cidr_block,
    ceil(log(local.no_of_public_subnet * 2, 2)),
    count.index
  )

  tags = {
    type                                       = "Public"
    Vpv                                        = var.vpc_id
    Name                                       = format("Public_subnet_%s", data.aws_availability_zones.available.names[count.index]),
    "kubernetes.io/role/elb"                   = "1"
    "kubernetes.io/cluster/${var.cluser_name}" = "owned"
  }
}


