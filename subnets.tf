resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = "public subnet"
  }
}


resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.private_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    Name = "private subnet"
  }
}
