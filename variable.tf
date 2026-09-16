variable "client_id" {
  description = "Service principal client ID (null falls back to Azure CLI login)"
  default     = null
  type        = string
}

variable "client_secret" {
  description = "Service principal client secret"
  default     = null
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure subscription ID"
  default     = null
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  default     = null
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "Azure-AI-Foundry-RG"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  default     = "East US"
  type        = string
}

variable "tags" {
  description = "The tags to associate with the resource group"
  default = {
    environment = "dev"
  }
  type = map(string)
}

variable "environment" {
  description = "The environment for the resource group (e.g., dev, prod)"
  default     = "dev"
  type        = string
}

variable "ai_foundry_name" {
  description = "The name of the AI Foundry instance"
  default     = "Azure-AI-Foundry-Instance"
  type        = string
}

variable "ai_foundry_sku" {
  description = "The SKU of the AI Foundry instance"
  default     = "Standard"
  type        = string
}
variable "ai_foundry_capacity" {
  description = "The capacity of the AI Foundry instance"
  default     = 1
  type        = number
}

variable "storage_account_name" {
  description = "The name of the storage account"
  default     = "azurefoundry20260915"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  default     = "terraform-container-state"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Key Vault"
  default     = "AzureAIFoundryKV20260915"
  type        = string
}

variable "ai_foundry_project" {
  description = "The name of the AI Foundry project"
  default     = "Azure-AI-Foundry-Project"
  type        = string
}
