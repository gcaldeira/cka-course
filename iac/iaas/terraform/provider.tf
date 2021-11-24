terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.77.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-cka-iac"
    storage_account_name = "spyckaiac"
    container_name       = "tfstate"
    key                  = "iaas/terraform.tfstate"
  }
}

provider "azurerm" {
  features { }
}