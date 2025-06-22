terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "c6c56365-55a1-4247-8cc9-5e121216cb09"
    features {
        resource_group {
      prevent_deletion_if_contains_resources = false
    }
    
    }
}

resource "azurerm_resource_group" "example" {
  name     = "my-terraform-rg"
  location = "West US"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystoragejoey23"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}