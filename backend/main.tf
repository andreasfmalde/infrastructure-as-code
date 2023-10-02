resource "azurerm_resource_group" "rg" {
    name = "${var.base_name}-rg"
    location = var.location
}

resource "random_string" "random" {
    length = 6
    upper = false
    special = false
}

resource "azurerm_storage_account" "sa" {
    name = "${var.base_name}sa${random_string.random.result}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc" {
    name = var.storage_container_name
    storage_account_name = azurerm_storage_account.sa.name
    container_access_type = "private"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
    name = "${var.base_name}kv${random_string.random.result}"
    location = var.location
    resource_group_name = azurerm_resource_group.rg.name
    enabled_for_disk_encryption = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = "standard"

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        key_permissions = [
        "Get","List","Create","Delete"
        ]

        secret_permissions = [
        "Get","List","Set","Delete"
        ]

        storage_permissions = [
        "Get","List","Set","Delete"
        ]
    }
}

resource "azurerm_key_vault_secret" "kv_secret" {
    name = var.key_vault_secrect_name
    value = azurerm_storage_account.sa.primary_access_key
    key_vault_id = azurerm_key_vault.kv.id
}