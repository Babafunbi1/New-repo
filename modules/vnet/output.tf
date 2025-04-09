output "network_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "firewall_subnet_id" {
  description = "ID of the Firewall Subnet "
  value = azurerm_subnet.firewall_subnet.id
}

output "app_subnet_id" {
  description = "ID of the application subnet"
  value = azurerm_subnet.app_subnet.id

}