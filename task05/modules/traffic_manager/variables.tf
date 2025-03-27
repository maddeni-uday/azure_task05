variable "name" {
  type        = string
  description = "The name of the Traffic Manager profile."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the Traffic Manager profile is created."
}

variable "routing_method" {
  type        = string
  description = "The routing method for Traffic Manager, e.g., Performance, Priority, Weighted."
}

# variable "endpoints" {
#   type = list(object({
#     name     = string # Endpoint name
#     type     = string # Endpoint type
#     target   = string # Target resource (e.g., App Service URL)
#     priority = number # Priority of routing
#   }))
#   description = "List of endpoints for the Traffic Manager profile."
# }


variable "endpoints" {
  type = list(object({
    name     = string
    target   = string
    priority = number
  }))
  description = "value"
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the Traffic Manager profile."
}
