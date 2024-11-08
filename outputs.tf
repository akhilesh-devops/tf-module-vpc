output "vpc" {
  value = aws_vpc.vpc
}

output "subnets" {
  value = module.subnets
}