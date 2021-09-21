resource "azurerm_virtual_network" "this" {
  name = "vnet-${var.alias}"
  resource_group_name = azurerm_resource_group.this.name
  location = var.location
  address_space = [ var.address_prefix ]
}

resource "azurerm_subnet" "k8s" {
  name = "k8s"
  resource_group_name = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes = [ cidrsubnet(var.address_prefix, 2, 1) ]
}