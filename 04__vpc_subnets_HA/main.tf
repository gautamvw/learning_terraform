resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Project VPC"
  }
}

variable "my_subnets" {
  type = map(object({
    cidr = string
    az   = string
  }))
  description = "Subnets for My VPC"
}

resource "aws_subnet" "my_subnets" {
  for_each          = var.my_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az
  tags = {
    Name = "Subnet - ${each.value.az}"
  }
}