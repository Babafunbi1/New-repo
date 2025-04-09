output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.storage.name
}

output "storage_account_id" {
  description = "The resource ID of the storage account"
  value       = azurerm_storage_account.storage.id
}
