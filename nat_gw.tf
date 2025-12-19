resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eib.id
  subnet_id     = aws_subnet.pub_sub1.id

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.gw]
}