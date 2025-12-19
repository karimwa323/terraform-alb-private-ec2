resource "aws_route_table" "priv-rt" {
  vpc_id = aws_vpc.nti-vpc.id

  route {
    cidr_block = aws_subnet.priv-sub.cidr_block
    gateway_id = aws_nat_gateway.nat_gw.id
  }


  tags = {
    Name = "example"
  }
}

resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.nti-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public-rt"
  }
}