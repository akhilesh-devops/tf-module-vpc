# locals {
#   #subnets
#   public_subnet_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "id", null): v.id]
#   app_subnet_ids    = [for k,v in lookup(lookup(module.subnets, "app", null), "id", null): v.id]
#   db_subnet_ids     = [for k,v in lookup(lookup(module.subnets, "db", null), "id", null): v.id]
#
#   #Routetable
#   public_route_table_ids = [for k,v in lookup(lookup(module.subnets, "public", null), "id", null): v.id]
#   app_route_table_ids    = [for k,v in lookup(lookup(module.subnets, "app", null), "id", null): v.id]
#   db_route_table_ids     = [for k,v in lookup(lookup(module.subnets, "db", null), "id", null): v.id]
# }