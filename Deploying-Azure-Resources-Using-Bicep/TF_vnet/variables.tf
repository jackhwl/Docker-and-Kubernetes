variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  default     = "wenlin_tf_RG"
  description = "The resource group name"
}

variable "storage_account_name" {
  default     = "wenlintfstorage1234"
  description = "The storage account name"
}

variable "vnet_name" {
  default     = "wenlintfvnet42"
  description = "The vnet name"
}