resource "azurerm_virtual_network" "vnet" {
  name                = var.network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_cidr
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "${var.network_name}-subnet-1"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.app_subnet_cidr

}

resource "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.firewall_subnet_cidr
}

