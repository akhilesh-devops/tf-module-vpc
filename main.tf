resource "aws_vpc" "vpc" {
  cidr_block = var.cidr

  tags = {
    Name = "dev"
  }
}

module "subnets" {
  source = "./module"

  for_each = var.subnets
  subnets  = each.value
  vpc_id   = aws_vpc.vpc.id

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}

# resource "aws_route" "route" {
#   for_each                  = var.subnets
#   route_table_id            = lookup(lookup(aws_route_table.rt, each.key, null), "id", null)
#   destination_cidr_block    = "0.0.0.0/0"
#   gateway_id                = aws_internet_gateway.igw.id
# }

