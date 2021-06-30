# resource "aws_subnet" "public" {
#   for_each = var.public_subnet_numbers
#   vpc_id = aws_vpc.myvpc.id
#   cidr_block = cidrsubnet(aws_vpc.myvpc.cidr_block, 4, each.value)
#   map_public_ip_on_launch = true
# }
#
# resource "aws_subnet" "private" {
#   for_each = var.private_subnet_numbers
#   vpc_id = aws_vpc.myvpc.id
#   cidr_block = cidrsubnet(aws_vpc.myvpc.cidr_block, 4, each.value)
# }
#
#
# output "public_subnets"{
#   value = {
#     for subnet in aws_subnet.public:
#       subnet.id => subnet.cidr_block
#   }
# }
#
#
# output "private_subnets"{
#   value = {
#     for subnet in aws_subnet.private:
#       subnet.id => subnet.cidr_block
#   }
# }
