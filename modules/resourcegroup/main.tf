resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "qframeworknn4" # must be globally unique and 3-24 lowercase letters/number
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2" # 🔐 Secure TLS config

  tags = {
    environment = "dev"
    project     = "qualityframework"
  }
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}
