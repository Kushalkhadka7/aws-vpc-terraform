
resource "aws_nat_gateway" "nat_gw" {
  count         = length(local.availability_zones)
  allocation_id = element(aws_eip.elastic_ip.*.id, count.index)
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)

  tags = {
    Name = "Nat gateway"
  }

  lifecycle {
    create_before_destroy = true
  }

  # Elastic ip should be enabled first.
  depends_on = [aws_eip.elastic_ip, aws_subnet.private_subnet, aws_subnet.public_subnet]
}
