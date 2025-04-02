variable "resource_groups" {
  description = "List of resource groups with their names and locations"
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "app_service_plans" {
  description = "List of app service plans with their names, locations, SKU, and worker count"
  type = map(object({
    name         = string
    sku          = string
    worker_count = number
    tags         = map(string)
  }))
}

variable "app_services" {
  description = "List of app services with their names and service plan associations"
  type = map(object({
    name = string
    tags = map(string)
  }))
}

variable "traffic_manager" {
  description = "Traffic manager profile configuration"
  type = object({
    name           = string
    routing_method = string
    tags           = map(string)
  })
}

variable "ip_restrictions" {
  description = "List of IP restrictions applied to the App Services."
  type = list(object({
    name        = string           # Rule name
    ip_address  = optional(string) # Restrict to specific IP address (optional)
    service_tag = optional(string) # Restrict to Azure Service tag (optional)
    action      = string           # Allow or Deny
    priority    = number           # Priority of the rule
  }))
}

