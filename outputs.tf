output "name" {
  description = "Route table name."
  value       = azurerm_route_table.main.name
}

output "id" {
  description = "Route table ID."
  value       = azurerm_route_table.main.id
}

output "resource" {
  description = "Route table resource object."
  value       = azurerm_route_table.main
}

output "force_internet_tunneling_route" {
  description = "Route object for Force Internet Tunneling."
  value       = one(azurerm_route.force_internet_tunneling[*])
}
