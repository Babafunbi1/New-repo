output "app_nsg_id" {
  description = "The ID of the application NSG"
  value       = azurerm_network_security_group.app_nsg.id
}

output "app_nsg_name" {
  description = "The name of the application NSG"
  value       = azurerm_network_security_group.app_nsg.name
}

output "firewall_nsg_id" {
  description = "The ID of the firewall NSG"
  value       = azurerm_network_security_group.firewall_nsg.id
}

output "firewall_nsg_name" {
  description = "The name of the firewall NSG"
  value       = azurerm_network_security_group.firewall_nsg.name
}

output "app_nsg_association" {
  description = "Association resource ID between app subnet and NSG"
  value       = azurerm_subnet_network_security_group_association.nsg-app.id
}

output "firewall_nsg_association" {
  description = "Association resource ID between firewall subnet and NSG"
  value       = azurerm_subnet_network_security_group_association.nsg-firewall.id
}