resource "aws_eip" "my_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.myigw]
}
