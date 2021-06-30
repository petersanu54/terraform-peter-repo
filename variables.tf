variable "instancetype" {
  type = map(any)
  default = {
    "test" = "t2.nano"
    "dev"  = "t2.micro"
    "prod" = "t2.large"
  }
}


variable "tags" {
  default = "dev"
}


variable "ports" {
  type    = list(number)
  default = [80, 443, 22]
}

variable "vpc_cidr_range" {
  default = "10.0.0.0/16"
}

variable "public_cidr_block" {
  default = "10.0.0.0/21"
}

variable "private_cidr_block" {
  default = "10.0.8.0/21"
}
