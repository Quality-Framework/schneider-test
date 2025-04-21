<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9, < 2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.117, < 5.0 |

## Providers

No providers.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be deployed | `string` | `"East US"` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | The name of the resource group where resources will be deployed | `string` | `"shared-rg"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->