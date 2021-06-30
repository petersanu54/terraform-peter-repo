# public ec2 instance
resource "aws_instance" "myec2" {
  ami                         = data.aws_ami.myami.id
  iam_instance_profile        = aws_iam_instance_profile.iamprofile.name
  instance_type               = lookup(var.instancetype, var.tags)
  key_name                    = aws_key_pair.mykeypair.key_name
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_SG.id]
  associate_public_ip_address = true
  tags = {
    Name = "public-instance"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12", #install nginx
      "sudo systemctl start nginx"                     #start nginx
    ]
  }

  # provisioner "remote-exec" {
  #   when = destroy
  #   inline = [
  #     "sudo service nginx stop",
  #     "sudo yum remove nginx"
  #   ]
  #
  # }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-provisioners.pem")
    host        = self.public_ip
  }

  depends_on = [aws_internet_gateway.myigw]

}


# private ec2 instance
resource "aws_instance" "private-myec2" {
  ami                    = data.aws_ami.myami.id
  iam_instance_profile   = aws_iam_instance_profile.iamprofile.name
  instance_type          = lookup(var.instancetype, var.tags)
  key_name               = aws_key_pair.mykeypair.key_name
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.private_SG.id]
  tags = {
    Name = "private-instance"
  }
}

# data source ami block
data "aws_ami" "myami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}



output "publicip" {
  value = aws_instance.myec2.public_ip
}
