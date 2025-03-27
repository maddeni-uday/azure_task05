variable "name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the resource group is to be deployed."
}

variable "tags" {
  type        = map(string)
  description = "Tags to associate with the resource group."
}
