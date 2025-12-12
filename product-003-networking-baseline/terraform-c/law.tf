resource "azurerm_resource_group" "rg" {
  name     = "rg-product-003-${var.order_num}"
  location = "westeurope"
}

resource "azurerm_log_analytics_workspace" "network" {
  name                = "law-product-003-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}


