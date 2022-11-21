# Private route table rules.
# Here the routes are defined within the route_table resource.
# Aditionally we can use aws_route resource to define the routing rules.
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  count  = length(var.availability_zones)

  route {
    cidr_block = var.private_subnet_cidr
    gateway_id = element(aws_nat_gateway.nat_gw.*.id, count.index)
  }

  tags = {
    Vpc  = var.vpc_id
    Name = "Private route table"
  }
}

# Associate route table and subnet (For private subnet).
resource "aws_route_table_association" "priavet_rt_association" {
  count          = length(var.availability_zones)
  route_table_id = element(aws_route_table.private_rt.*.id, count.index)
  subnet_id      = element(aws_subnet.private_subnet.*.id, count.index)
}


# Public route table rules.
# Here the routes are defined within the route_table resource.
# Aditionally we can use aws_route resource to define the routing rules.
resource "aws_route_table" "public_rt" {
  count  = 1
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gw_id
  }

  tags = {
    Name = "Public route table"
    Vpc  = var.vpc_id
    type = "Public"
  }
}


# Associate route table and subnet (For public subnet).
resource "aws_route_table_association" "public_rt_association" {
  count          = length(var.availability_zones)
  route_table_id = aws_route_table.public_rt[0].id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}
