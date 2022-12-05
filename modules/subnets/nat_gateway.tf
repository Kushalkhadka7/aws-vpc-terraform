locals {
  no_of_nat_gw = no_of_public_subnet
}


# Enable elastic_ip to be assigned and use inside the vpc.
# These elastic ip will used by NAT Gateway.
resource "aws_eip" "this" {
  vpc   = true
  count = var.create_nat_gateway ? local.no_of_nat_gw : 0

  lifecycle {
    create_before_destroy = true
  }
}


# Creates aws nat gateway in each public subnet.
# eg. If there are 3 public subnets then it will create nat gateway in 
# each subnets. 
resource "aws_nat_gateway" "this" {
  count = var.create_nat_gateway ? local.no_of_nat_gw : 0

  allocation_id = element(aws_eip.this.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)

  tags = {
    Vpc  = var.vpc_id
    Name = "Nat gateway"
  }

  lifecycle {
    create_before_destroy = true
  }
}
