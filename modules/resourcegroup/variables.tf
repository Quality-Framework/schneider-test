variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "qualityframework-demo-13"
}

variable "location" {
  description = "Azure region for the Resource Group"
  type        = string
  default     = "East US"
}
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}
# variable "unused_variable" {
#   type    = string
#   default = "This is never used"
# }