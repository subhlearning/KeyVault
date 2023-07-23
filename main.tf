resource random_string main {
  length  = 8
  upper   = false
  special = false

}


resource azurerm_resource_group main {
  name     = "rg-proj3-${random_string.main.result}"
  location = var.location
}


resource azurerm_key_vault main {
  name                        = "kv-proj3-${random_string.main.result}"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false

  sku_name = "standard"

}

data azurerm_client_config current {

}

resource azurerm_key_vault_access_policy terraform_user {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
    "Backup","Delete","Get","List","Purge","Recover","Restore","Set"
  ]
}