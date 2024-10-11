resource "azurerm_route_table" "main" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = var.bgp_route_propagation_enabled

  tags = merge(local.default_tags, var.extra_tags)
}

moved {
  from = azurerm_route_table.route_table
  to   = azurerm_route_table.main
}

resource "azurerm_route" "force_internet_tunneling" {
  count = var.force_tunneling_enabled ? 1 : 0

  name                = "InternetForceTunneling"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.main.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "VirtualNetworkGateway"
}
