terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "afmbackend-rg"
    storage_account_name = "afmbackendsam7q5ab"
    container_name       = "tfstate"
    key                  = "workflow-test.tfstate"
  }

}

provider "azurerm" {
  features {}
}
  