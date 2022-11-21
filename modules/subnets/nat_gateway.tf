
# Enable elastic_ip to be assigned and use inside the vpc.
resource "aws_eip" "elastic_ip" {
  vpc   = true
  count = length(var.availability_zones)

  lifecycle {
    create_before_destroy = true
  }
}


# Creates aws nat gateway in each public subnet.
# eg. If there are 3 public subnets then it will create nat gateway in 
# each subnets. 
resource "aws_nat_gateway" "nat_gw" {
  count         = length(var.availability_zones)
  allocation_id = element(aws_eip.elastic_ip.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)

  tags = {
    Vpc  = var.vpc_id
    Name = "Nat gateway"
  }

  lifecycle {
    create_before_destroy = true
  }
}
