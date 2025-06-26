variable "resource_group_names" {
  type = list(string)
  default = [
    "qf-resourcegroup",
    "qf-resourcegroup-1",
    "qf-resourcegroup-2",
    "qf-resourcegroup-3",
    "qf-test-rg",
    "qf-test-rg-1",
    "qf-test-rg-2",
    "qf-test-rg-3",
    "qf-test-rg-4",
    "qf-test-rg-5",
    "qf-test-rg-6",
    "qf-test-rg-7",
    "qf-test-rg-8",
    "qf-test-rg-9",
    "qf-test-rg-10",
    "qf-test-rg-11",
    "qf-test-rg-13",
    "qf-test-rg-15",
    "qf-test-rg-21",
    "qf-test-rg-github",
    "qualityframework-demo-rg" 
  ]
}

variable "location" {
  type    = string
  default = "East US"
}

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.resource_group_names)

  name     = each.key
  location = var.location
}

output "all_resource_group_names" {
  value = [for rg in azurerm_resource_group.rg : rg.name]
}

# Correct storage account-resource group mapping from your screenshot
resource "azurerm_storage_account" "sa" {
  for_each = {
    qualityframeworksa0302 = "qf-resourcegroup"
    qualityframeworksa0303 = "qf-resourcegroup-1"
    qualityframeworksa0305 = "qf-resourcegroup-3"
    qualityframeworksa12   = "qualityframework-demo-rg"
  }

  name                     = each.key
  resource_group_name      = each.value
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  tags = {
    environment = "dev"
    project     = "qualityframework"
  }
}

output "all_storage_account_names" {
  value = [for sa in azurerm_storage_account.sa : sa.name]
}
