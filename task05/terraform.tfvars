resource_groups = {
  rg1 = {
    name     = "cmaz-93253787-mod5-rg-01"
    location = "West Europe"
    tags     = { Creator = "maddeni_uday@epam.com" }
  },
  rg2 = {
    name     = "cmaz-93253787-mod5-rg-02"
    location = "East US"
    tags     = { Creator = "maddeni_uday@epam.com" }
  },
  rg3 = {
    name     = "cmaz-93253787-mod5-rg-03"
    location = "North Europe"
    tags     = { Creator = "maddeni_uday@epam.com" }
  }
}

app_service_plans = {
  asp1 = {
    name         = "cmaz-93253787-mod5-asp-01"
    sku          = "P0v3"
    worker_count = 2
    os_type      = "Windows"
    tags         = { Creator = "maddeni_uday@epam.com" }
  },
  asp2 = {
    name         = "cmaz-93253787-mod5-asp-02"
    sku          = "P1v3"
    worker_count = 1
    os_type      = "Windows"
    tags         = { Creator = "maddeni_uday@epam.com" }
  }
}

app_services = {
  app1 = {
    name = "cmaz-93253787-mod5-app-01"
    tags = { Creator = "maddeni_uday@epam.com" }
  },
  app2 = {
    name = "cmaz-93253787-mod5-app-02"
    tags = { Creator = "maddeni_uday@epam.com" }
  }
}

traffic_manager = {
  name           = "cmaz-93253787-mod5-traf"
  routing_method = "Performance"
  tags           = { Creator = "maddeni_uday@epam.com" }
}