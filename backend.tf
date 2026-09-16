terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform-State"               # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "terraformbackendstate"         # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "terraform-container-state"     # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev-foundry.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
