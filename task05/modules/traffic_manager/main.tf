resource "azurerm_traffic_manager_profile" "tm_profile" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  traffic_routing_method = var.routing_method

  dns_config {
    relative_name = var.name
    ttl           = 60
  }

  monitor_config {
    protocol = "HTTPS"
    port     = 443
    path     = "/"
  }

  tags = var.tags
}

resource "azurerm_traffic_manager_azure_endpoint" "tm_endpoint" {
  for_each   = { for index, endpoint in var.endpoints : index => endpoint }
  profile_id = azurerm_traffic_manager_profile.tm_profile.id

  name               = each.value.name
  target_resource_id = each.value.target
  priority           = each.value.priority
}
