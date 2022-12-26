# Create aws vpc.
resource "aws_vpc" "this" {
  cidr_block                           = var.vpc_cidr
  instance_tenancy                     = var.instance_tenancy
  enable_classiclink                   = var.enable_classiclink
  enable_dns_support                   = var.enable_dns_support
  enable_dns_hostnames                 = var.enable_dns_hostnames
  enable_classiclink_dns_support       = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block     = var.assign_generated_ipv6_cidr_block
  enable_network_address_usage_metrics = var.enable_network_address_usage_metrics

  tags = merge(var.tags, var.additional_tags)
}

# Create a default security group for vpc.
# If this is not created it will create a default security group
# automatically which allows all ingress and egresss traffic.
resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(var.tags, var.additional_tags)
}
