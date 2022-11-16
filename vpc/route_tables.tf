# Private route table rules.

locals {
  availability_zones = var.aws_availability_zones_available
}
resource "aws_route_table" "private_rt" {
  count  = length(local.availability_zones)
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = var.private_route_cidr

    gateway_id = element(aws_nat_gateway.nat_gw.*.id, count.index)
  }

  tags = {
    Name = "Private route table"
  }
}

# Public route table rules.
resource "aws_route_table" "public_rt" {
  count  = length(local.availability_zones)
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "Public route table"
  }
}
