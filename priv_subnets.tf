resource "aws_subnet" "priv-sub" {
  vpc_id     = aws_vpc.nti-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "priv"
  }
}