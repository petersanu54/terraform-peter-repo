resource "aws_nat_gateway" "my-ngw" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "my-nat-gateway"
  }

  depends_on = [aws_internet_gateway.myigw]
}



output "nat-id" {
  value = aws_nat_gateway.my-ngw.id
}
