variable "name" {
  type        = string
  description = "The name of the Windows App Service."
}

variable "location" {
  type        = string
  description = "The Azure region where the App Service will be deployed."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the App Service will be created."
}

variable "service_plan_id" {
  type        = string
  description = "The ID of the App Service Plan associated with this Windows App Service."
}

variable "ip_restrictions" {
  type = list(object({
    name        = string
    ip_address  = optional(string)
    service_tag = optional(string)
    action      = string
    priority    = number
  }))
  description = "List of IP restrictions applied to the App Service."
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the App Service."
}
