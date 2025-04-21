variable "location" {
  description = "The Azure region where resources will be deployed"
  type        = string
  defaut      = East US
}
 
variable "rg_name" {
  description = "The name of the resource group where resources will be deployed"
  type        = string
  default     = shared-rg
}
 
