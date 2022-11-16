# Vpc Resource.
resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  assign_generated_ipv6_cidr_block = true

  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "Default Security Group for vpc"
  }
}

# Enable elastic_ip to be assigned and use inside the vpc.
resource "aws_eip" "elastic_ip" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

