# Creates private subnet across the no of availability zones.
# Eg. If the region have 3 AZ, 3 private subnets will be created.
resource "aws_subnet" "private_subnet" {
  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id
  count                   = length(var.availability_zones)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = length(var.private_subnet_cidr) == 1 ? var.public_subnet_cidr : format("192.168.%d.0/24", count.index + 50)

  tags = {
    type = "Private"
    Vpv  = var.vpc_id
    Name = format("Private_subnet_%s", element(var.availability_zones, count.index)),
  }
}

# Creates public subnet across the no of availability zones.
# Eg. If the region have 3 AZ, 3 pubilc subnets will be created.
resource "aws_subnet" "public_subnet" {
  map_public_ip_on_launch = true
  vpc_id                  = var.vpc_id
  count                   = length(var.availability_zones)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = length(var.public_subnet_cidr) == 1 ? var.public_subnet_cidr : format("192.168.%d.0/24", count.index + 1)

  tags = {
    type = "Public"
    Vpv  = var.vpc_id
    Name = format("Public_subnet_%s", element(var.availability_zones, count.index)),
  }
}


