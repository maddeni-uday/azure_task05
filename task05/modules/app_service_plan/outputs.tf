output "id" {
  value       = azurerm_service_plan.app_service_plan.id
  description = "The ID of the created App Service Plan."
}

output "name" {
  value       = azurerm_service_plan.app_service_plan.name
  description = "The name of the App Service Plan."
}
