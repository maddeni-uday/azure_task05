# Reference Resource Group Modules
module "rg1" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg1"].name
  location = var.resource_groups["rg1"].location
  tags     = var.resource_groups["rg1"].tags
}

module "rg2" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg2"].name
  location = var.resource_groups["rg2"].location
  tags     = var.resource_groups["rg2"].tags
}

module "rg3" {
  source   = "./modules/resource_group"
  name     = var.resource_groups["rg3"].name
  location = var.resource_groups["rg3"].location
  tags     = var.resource_groups["rg3"].tags
}
module "asp1" {
  source              = "./modules/app_service_plan"
  name                = var.app_service_plans["asp1"].name
  location            = module.rg1.location
  resource_group_name = module.rg1.name
  sku                 = var.app_service_plans["asp1"].sku
  worker_count        = var.app_service_plans["asp1"].worker_count
  os_type             = "Windows"
  tags                = var.app_service_plans["asp1"].tags
}

module "asp2" {
  source              = "./modules/app_service_plan"
  name                = var.app_service_plans["asp2"].name
  location            = module.rg2.location
  resource_group_name = module.rg2.name
  sku                 = var.app_service_plans["asp2"].sku
  worker_count        = var.app_service_plans["asp2"].worker_count
  os_type             = "Windows"
  tags                = var.app_service_plans["asp2"].tags
}

module "app1" {
  source              = "./modules/app_service"
  name                = var.app_services["app1"].name
  location            = module.rg1.location
  resource_group_name = module.rg1.name
  service_plan_id     = module.asp1.id
  ip_restrictions = [
    { name = "allow-ip", action = "Allow", ip_address = "18.153.146.156/32", service_tag = null, priority = 65000 },
    { name = "allow-tm", action = "Allow", service_tag = "AzureTrafficManager", ip_address = null, priority = 65000 },
    { name = "deny-all", ip_address = "0.0.0.0/0", service_tag = null, action = "Deny", priority = 2147483647 }
  ]
  tags = var.app_services["app1"].tags
}

module "app2" {
  source              = "./modules/app_service"
  name                = var.app_services["app2"].name
  location            = module.rg2.location
  resource_group_name = module.rg2.name
  service_plan_id     = module.asp2.id
  ip_restrictions = [
    { name = "allow-ip", action = "Allow", ip_address = "18.153.146.156/32", service_tag = null, priority = 65000 },
    { name = "allow-tm", action = "Allow", service_tag = "AzureTrafficManager", ip_address = null, priority = 65000 },
    { name = "deny-all", ip_address = "0.0.0.0/0", service_tag = null, action = "Deny", priority = 2147483647 }
  ]
  tags = var.app_services["app2"].tags
}

# Reference Traffic Manager Module
module "traffic_manager" {
  source              = "./modules/traffic_manager"
  name                = var.traffic_manager.name
  resource_group_name = module.rg3.name # RG3 provides the resource group for the Traffic Manager profile
  routing_method      = var.traffic_manager.routing_method
  endpoints = [
    {
      name     = module.app1.name
      type     = "azureEndpoints"
      target   = module.app1.resource_id
      priority = 1
    },
    {
      name     = module.app2.name
      type     = "azureEndpoints"
      target   = module.app2.resource_id
      priority = 2
    }
  ]
  tags = var.traffic_manager.tags
}
