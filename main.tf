resource "azurerm_virtual_network" "instance" {
  address_space       = [var.network]
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group

  tags = var.tags
}

