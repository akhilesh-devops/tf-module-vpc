resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
    Name = "dev"
  }
}

module "subnets" {
  source = "./module"

  for_each = var.subnets
  subnets  = each.value
  vpc      = aws_vpc.main.id
}