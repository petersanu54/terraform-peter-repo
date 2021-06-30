# variable "instancetype" {
#   type = map
#   default = {
#     "test" = "t2.nano"
#     "dev" = "t2.micro"
#     "prod" = "t2.large"
#   }
# }
#
#
# variable "tags" {}
#
#
# variable "ports"{
#   type = list(number)
#   default = [8200,8201,8203,8204]
# }
#
#
# variable "vpc_cidr_range"{
#   default = "10.0.0.0/16"
# }
#
#
# variable "public_subnet_numbers" {
#   type = map(number)
#   description = "Map of AZ to a number to be used for public subnets"
#   default = {
#     "us-east-1a" = 1
#     "us-east-1b" = 2
#     "us-east-1c" = 3
#   }
# }
#
#
# variable "private_subnet_numbers" {
#   type = map(number)
#   description = "Map of AZ to a number to be used for private subnets"
#   default = {
#     "us-east-1a" = 4
#     "us-east-1b" = 5
#     "us-east-1c" = 6
#   }
# }
