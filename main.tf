provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "foundry-rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_key_vault" "foundry-kv" {
  name                       = var.key_vault_name
  location                   = azurerm_resource_group.foundry-rg.location
  resource_group_name        = azurerm_resource_group.foundry-rg.name
  rbac_authorization_enabled = false
  tenant_id                  = data.azurerm_client_config.current.tenant_id

  sku_name                 = "standard"
  purge_protection_enabled = true
}

resource "azurerm_key_vault_access_policy" "test" {
  key_vault_id = azurerm_key_vault.foundry-kv.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Create",
    "Get",
    "Delete",
    "Purge",
    "GetRotationPolicy",
  ]
}

resource "azurerm_storage_account" "foundry-sa" {
  name                     = var.storage_account_name
  location                 = azurerm_resource_group.foundry-rg.location
  resource_group_name      = azurerm_resource_group.foundry-rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_ai_foundry" "foundry" {
  name                = var.ai_foundry_name
  location            = azurerm_resource_group.foundry-rg.location
  resource_group_name = azurerm_resource_group.foundry-rg.name
  storage_account_id  = azurerm_storage_account.foundry-sa.id
  key_vault_id        = azurerm_key_vault.foundry-kv.id

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_ai_foundry_project" "foundry_project" {
  name               = var.ai_foundry_project
  location           = azurerm_ai_foundry.foundry.location
  ai_services_hub_id = azurerm_ai_foundry.foundry.id

  identity {
    type = "SystemAssigned"
  }
}
