variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "testing-2"
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
