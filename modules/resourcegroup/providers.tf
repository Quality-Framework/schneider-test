terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.117, < 5.0"
    }
  }
}

provider "azurerm" {
  features {}

  use_oidc        = true # Required for OIDC authentication
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
