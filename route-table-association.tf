resource "aws_route_table_association" "public-rta" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_route_table_association" "private-rta" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}
