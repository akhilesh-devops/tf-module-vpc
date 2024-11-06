resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = "dev"
  }
}

module "subnets" {
  source = "./subnets"

  for_each = var.subnets
  subnets  = each.value
}

variable "subnets" {}
