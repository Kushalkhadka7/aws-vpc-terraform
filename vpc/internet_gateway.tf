# Gateway for vpc.
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "Vpc Internet gateway"
  }
}


