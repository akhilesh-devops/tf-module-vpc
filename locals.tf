locals {
  #subnets
  public_subnet_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "subnet_ids", null)]
  app_subnet_ids    = [ for k,v in lookup(lookup(module.subnets, "app", null), "subnet_ids", null)]
  db_subnet_ids     = [ for k,v in lookup(lookup(module.subnets, "app", null), "subnet_ids", null)]
  private_subnet_ids = concat(local.app_subnet_ids, local.db_subnet_ids)
}