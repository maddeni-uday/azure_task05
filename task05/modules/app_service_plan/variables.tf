variable "name" {
  type        = string
  description = "The name of the App Service Plan."
}

variable "location" {
  type        = string
  description = "The Azure region where the App Service Plan will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the App Service Plan will be created."
}

variable "sku" {
  type        = string
  description = "The SKU of the App Service Plan (e.g., P1v3, S1, B1)."
}

variable "worker_count" {
  type        = number
  description = "The number of workers/instances for the App Service Plan."
}

variable "os_type" {
  type        = string
  description = "The operating system type supported by this App Service Plan (e.g., Windows or Linux)."
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the App Service Plan."
}
