resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.pub_sub1.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.pub_sub2.id
  route_table_id = aws_route_table.pub-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.priv-sub.id
  route_table_id = aws_route_table.priv-rt.id
}
