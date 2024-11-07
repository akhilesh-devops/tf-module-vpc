locals {

  #Subnets
  public_subnet_ids = [ for k, v in lookup(lookup(module.subnets, "public", null), "subnets", null) : v.id]
  app_subnet_ids    = [ for k, v in lookup(lookup(module.subnets, "app", null), "subnets", null) : v.id]
  db_subnet_ids = [ for k, v in lookup(lookup(module.subnets, "db", null), "subnets", null) : v.id]
  private_subnet_ids = concat(local.app_subnet_ids, local.db_subnet_ids)

  #RT
  public_route_table_ids = [ for k,v in lookup(lookup(module.subnets, "public", null), "route_table", null) : v.id]
  app_route_table_ids = [ for k,v in lookup(lookup(module.subnets, "app", null), "route_table", null) : v.id]
  db_route_table_ids = [ for k,v in lookup(lookup(module.subnets, "db", null), "route_table", null) : v.id]
  private_route_table_ids = concat(local.app_route_table_ids, local.db_route_table_ids)
}