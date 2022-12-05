# Create aws vpc.
resource "aws_vpc" "this" {
  cidr_block                     = var.vpc_cidr
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
  enable_classiclink             = var.enable_classiclink
  enable_classiclink_dns_support = var.enable_classiclink_dns_support

  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "${var.vpc_name}"
  }
}

# Create a default security group for vpc.
# If this is not created it will create a default security group
# automatically which allows all ingress and egresss traffic.
resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "Default Security Group for VPC"
  }
}
