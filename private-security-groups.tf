resource "aws_security_group" "private_SG" {
  name        = "private_SG"
  description = "allow TLS"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["${var.public_cidr_block}"]
    }
  }

  vpc_id = aws_vpc.myvpc.id
}
