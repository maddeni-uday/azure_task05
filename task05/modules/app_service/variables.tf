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
  description = "IP restrictions for the App Service."
  type = list(object({
    name        = string           # Name of the rule
    ip_address  = optional(string) # IP address can be null
    service_tag = optional(string) # Service tag can be null
    action      = string           # Action: Allow or Deny
    priority    = number           # Priority for the rule
  }))
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the App Service."
}
