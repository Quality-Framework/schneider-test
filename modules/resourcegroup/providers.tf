terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.117, < 5.0"
    }
  }

  backend "azurerm" {
    use_oidc         = true
    use_azuread_auth = true
    # Other backend config values like tenant_id, client_id, subscription_id, etc., 
    # should be passed via -backend-config during terraform init
  }
}

provider "azurerm" {
  resource_provider_registrations = "disabled" # or "automatic" or "manual"

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  use_oidc        = true
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}
