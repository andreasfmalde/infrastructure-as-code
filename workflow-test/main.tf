locals {
  base = terraform.workspace == "default" ? var.base_name : "${var.base_name}${terraform.workspace}"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.base}-rg"
  location = var.location
}

resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "${local.base}sa${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
