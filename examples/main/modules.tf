module "route_table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short

  # You can set either a prefix for generated name or a custom one for the resource naming
  #custom_name = "my_route_table"

  # Options
  bgp_route_propagation_enabled = false
  force_tunneling_enabled       = true

  extra_tags = {
    foo = "bar"
  }
}

resource "azurerm_route" "custom_route" {
  name                = "acceptanceTestRoute1"
  resource_group_name = module.rg.name
  route_table_name    = module.route_table.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "VnetLocal"
}

# module "vnet" {
#   source  = "claranet/vnet/azurerm"
#   version = "x.x.x"

#   environment    = var.environment
#   location       = module.azure_region.location
#   location_short = module.azure_region.location_short
#   client_name    = var.client_name
#   stack          = var.stack

#   resource_group_name = module.rg.name
#   cidrs               = ["10.10.1.0/16"]
# }

# module "subnet" {
#   source  = "claranet/subnet/azurerm"
#   version = "x.x.x"

#   environment    = var.environment
#   location_short = module.azure_region.location_short
#   client_name    = var.client_name
#   stack          = var.stack

#   resource_group_name = module.rg.name

#   virtual_network_name = module.vnet.name
#   cidrs                = ["10.10.1.0/24"]

#   route_table_name = module.route_table.name
# }
