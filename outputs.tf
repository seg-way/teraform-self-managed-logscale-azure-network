output "virtual_network_name" {
  value = azurerm_subnet.instance.virtual_network_name
}
output "virtual_subnet_name" {
  value = azurerm_subnet.instance.name
}
output "virtual_subnet_id" {
  value = azurerm_subnet.instance.id
}
output "virtual_subnet_id_ag" {
  value = azurerm_subnet.ag.id
}
