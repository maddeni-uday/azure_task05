resource "azurerm_windows_web_app" "web_app" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = true

    # Define IP Restriction logic dynamically
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        name        = ip_restriction.value.name
        ip_address  = try(ip_restriction.value.ip_address, null)  # IP address can be missing
        service_tag = try(ip_restriction.value.service_tag, null) # Service tag can be missing
        action      = ip_restriction.value.action
        priority    = ip_restriction.value.priority
      }
    }
  }

  tags = var.tags
}
