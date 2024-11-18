output "subnets" {
  value = module.subnets
}

output "vpc" {
  value = aws_vpc.main
}