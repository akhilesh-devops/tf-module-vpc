resource "aws_subnet" "main" {
  for_each   = var.subnets
  vpc_id     = var.vpc_id
  cidr_block = each.value["cidr"]
  availability_zone = each.value["az"]

  tags = {
    Name = each.key
  }
}

resource "aws_route_table" "rt" {
  for_each = var.subnets
  vpc_id = var.vpc_id


  tags = {
    Name = each.key
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "igw"
  }
}

resource "aws_route" "route" {
  for_each                  = var.subnets
  route_table_id            = lookup(lookup(aws_route_table.rt, each.key, null), "id", null)
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.igw.id
}
