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
  vpc_id   = aws_vpc.main.id
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

# resource "aws_route" "r" {
#   for_each                  = lookup(module.subnets, )
#   route_table_id            =
#   destination_cidr_block    = "10.0.1.0/22"
#   vpc_peering_connection_id = "pcx-45ff3dc1"
# }
