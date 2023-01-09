resource "azurerm_virtual_network" "instance" {
  address_space       = [var.network]
  location            = var.location
  name                = "logscale-vn"
  resource_group_name = var.resource_group

  tags = var.tags
}

resource "azurerm_subnet" "instance" {
  address_prefixes                               = [var.subnet]
  name                                           = "logscale-sn"
  resource_group_name                            = var.resource_group
  virtual_network_name                           = azurerm_virtual_network.instance.name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints = [
    "Microsoft.ContainerRegistry",
    "Microsoft.Storage"
  ]

}
resource "azurerm_subnet" "ag" {
  address_prefixes                               = [var.subnet_ag]
  name                                           = "logscale-sn"
  resource_group_name                            = var.resource_group
  virtual_network_name                           = azurerm_virtual_network.instance.name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints = [
    "Microsoft.ContainerRegistry",
    "Microsoft.Storage"
  ]

}
