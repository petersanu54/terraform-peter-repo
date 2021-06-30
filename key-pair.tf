resource "aws_key_pair" "mykeypair" {
  key_name   = "ec2-keypair"
  public_key = file("${path.module}/public-key.pub")
}


output "my_key" {
  value = aws_key_pair.mykeypair.id
}
