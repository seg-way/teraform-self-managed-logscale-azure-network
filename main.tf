resource "azurerm_virtual_network" "instance" {
  address_space       = [var.network]
  location            = var.location
  name                = "vnet"
  resource_group_name = var.resource_group

  tags = var.tags
}

resource "azurerm_subnet" "instance" {
  address_prefixes                               = [var.subnet]
  name                                           = "k8s"
  resource_group_name                            = var.resource_group
  virtual_network_name                           = azurerm_virtual_network.instance.name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints = [
    "Microsoft.EventHub",
    "Microsoft.ContainerRegistry",
    "Microsoft.Storage"
  ]

}
resource "azurerm_subnet" "ag" {
  address_prefixes                               = [var.subnet_ag]
  name                                           = "ag"
  resource_group_name                            = var.resource_group
  virtual_network_name                           = azurerm_virtual_network.instance.name
  enforce_private_link_endpoint_network_policies = true
  

}
