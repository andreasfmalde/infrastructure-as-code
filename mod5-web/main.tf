resource "azurerm_resource_group" "rg" {
  name     = "${local.base}-rg"
  location = var.location
}

resource "random_string" "random" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                     = "${local.base}sa${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = var.index_document
  }

}

resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}<h2>${local.workspace_suffix}</h2>"
}

output "endpoint" {
  value = azurerm_storage_account.sa.primary_web_endpoint
}