resource "azurerm_virtual_network" "instance" {
  address_space       = [var.network]
  location            = local.resource_group.location
  name                = "logscale-vn"
  resource_group_name = local.resource_group.name
}

resource "azurerm_subnet" "instance" {
  address_prefixes                               = [var.subnet]
  name                                           = "logscale-sn"
  resource_group_name                            = local.resource_group.name
  virtual_network_name                           = azurerm_virtual_network.instance.name
  enforce_private_link_endpoint_network_policies = true
  service_endpoints = [
    "Microsoft.ContainerRegistry",
    "Microsoft.Storage"
  ]
}
