module "kv" {
  source              = "./modules/resourcegroup"
  name                = module.naming.key_vault.name_unique
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = data.azurerm_client_config.this.tenant_id
  keys = {
    cmk_for_storage_account = {
      key_opts = [
        "decrypt",
        "encrypt",
        "sign",
        "unwrapKey",
        "verify",
        "wrapKey"
      ]
      key_type = "RSA"
      name     = "cmk-for-storage-account"
      key_size = 2048
    }
  }
  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [module.privatednszone.resource_id]
      subnet_resource_id            = module.vnet.subnets["subnet1"].resource_id
    }
  }
  role_assignments = {
    deployment_user_kv_admin = {
      role_definition_id_or_name = "Key Vault Administrator"
      principal_id               = data.azurerm_client_config.this.object_id
    }
  }
  wait_for_rbac_before_key_operations = {
    create = "60s"
  }
}
