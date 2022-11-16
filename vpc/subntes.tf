# Creates private subnet across the no of availability zones.
# Eg. If the region have 3 AZ, 3 private subnets will be created.

locals {
  availability_zones_count = var.aws_availability_zones_available
}


resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.default.id
  map_public_ip_on_launch = true
  count                   = length(local.availability_zones_count)
  availability_zone       = element(local.availability_zones, count.index)
  cidr_block              = format("192.168.%d.0/24", count.index + 50)

  tags = {
    Name = format("Private_subnet_%s", element(local.availability_zones, count.index))
  }
}

# Creates public subnet across the no of availability zones.
# Eg. If the region have 3 AZ, 3 pubilc subnets will be created.
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.default.id
  map_public_ip_on_launch = true
  count                   = length(local.availability_zones_count)
  availability_zone       = element(local.availability_zones, count.index)
  cidr_block              = format("192.168.%d.0/24", count.index + 1)

  tags = {
    Name = format("Public_subnet_%s", element(local.availability_zones, count.index))
  }
}

# Associate route table and subnet (For private subnet).
resource "aws_route_table_association" "priavet_rt_association" {
  count          = length(local.availability_zones_count)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.private_rt.*.id, count.index)

  depends_on = [aws_route_table.private_rt, aws_subnet.private_subnet]
}

# Associate route table and subnet (For public subnet).
resource "aws_route_table_association" "public_rt_association" {
  count          = length(local.availability_zones_count)
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.public_rt.*.id, count.index)

  depends_on = [aws_route_table.public_rt, aws_subnet.public_subnet]
}
