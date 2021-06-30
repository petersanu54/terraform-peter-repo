resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr_range
  enable_dns_hostnames = true
  tags = {
    Name = "my-vpc"
  }
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}
