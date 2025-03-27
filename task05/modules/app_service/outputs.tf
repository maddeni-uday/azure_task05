output "default_hostname" {
  value       = azurerm_windows_web_app.web_app.default_hostname
  description = "The default hostname of the App Service"
}

output "resource_id" {
  value       = azurerm_windows_web_app.web_app.id
  description = "The Azure Resource ID for the Windows Web App."
}

output "name" {
  value       = azurerm_windows_web_app.web_app.name
  description = "The name of the created App Service"
}
