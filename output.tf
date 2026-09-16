output "resource_group_name" {
  value = azurerm_resource_group.foundry-rg.name
}

output "location" {
  value = azurerm_resource_group.foundry-rg.location
}

output "tags" {
  value = azurerm_resource_group.foundry-rg.tags
}

output "ai_foundry_name" {
  value = azurerm_ai_foundry.foundry.name
}


output "storage_account_name" {
  value = azurerm_storage_account.foundry-sa.name
}




