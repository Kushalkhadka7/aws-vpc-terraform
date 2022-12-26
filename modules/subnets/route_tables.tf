# Private route table rules.
# Here the routes are defined within the route_table resource.
# Aditionally we can use aws_route resource to define the routing rules.
resource "aws_route_table" "private_rt" {
  vpc_id = var.vpc_id
  count  = local.no_of_private_subnet

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = element(aws_nat_gateway.this.*.id, count.index)
  }

  tags = merge({
    Vpc  = var.vpc_id
    Name = "Private route table"
  }, var.tags, var.additional_tags)
}

# Associate route table and subnet (For private subnet).
resource "aws_route_table_association" "priavet_rt_association" {
  count          = local.no_of_private_subnet
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

  tags = merge({
    Name = "Public route table"
    Vpc  = var.vpc_id
    type = "Public"
  }, var.tags, var.additional_tags)
}


# Associate route table and subnet (For public subnet).
resource "aws_route_table_association" "public_rt_association" {
  count          = local.no_of_public_subnet
  route_table_id = aws_route_table.public_rt[0].id
  subnet_id      = element(aws_subnet.public_subnet.*.id, count.index)
}
