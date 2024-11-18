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

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route" "rt" {
  for_each                  = lookup(lookup(module.subnets, "public", null), "route_table_ids", null)
  route_table_id            = each.value["id"]
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
}

resource "aws_eip" "ngw" {
  for_each = lookup(lookup(module.subnets, "public", null), "subnet_ids", null)

  domain   = "vpc"
  tags = {
    Name = each.key
  }
}

resource "aws_nat_gateway" "ngw" {
  for_each      = lookup(lookup(module.subnets, "public", null), "subnet_ids", null)
  allocation_id = lookup(aws_eip.ngw, "*.id", null)
  subnet_id     = each.value["id"]

  tags = {
    Name = each.key
  }
}