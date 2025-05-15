resource "azurerm_route_table" "route_table" {
  name                = local.rt_name
  location            = var.location
  resource_group_name = var.resource_group_name

  bgp_route_propagation_enabled = var.disable_bgp_route_propagation

  tags = merge(local.default_tags, var.extra_tags)
}

resource "azurerm_route" "force_internet_tunneling" {
  name                = "InternetForceTunneling"
  resource_group_name = var.resource_group_name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "VirtualNetworkGateway"

  count = var.enable_force_tunneling ? 1 : 0
}

