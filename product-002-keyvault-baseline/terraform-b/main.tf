terraform {
  required_version = ">= 1.0.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.55.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.subscription_id
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = "MyResourceGroup-${var.order_num}"
  location = "westeurope"
}

resource "azurerm_service_plan" "plan" {
  name                = "MyPlan-${var.order_num}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_name            = "F1"
  os_type             = "Linux"
}

resource "azurerm_linux_web_app" "app" {
  name                = "MyWebApp-${var.order_num}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.plan.location
  service_plan_id     = azurerm_service_plan.plan.id

  https_only = true #false

  site_config {
    ftps_state          = "FtpsOnly" #"Disabled"
    minimum_tls_version = "1.0"
    always_on           = false
  }
}

resource "azurerm_key_vault" "kv" {
  name                = "kv${var.order_num}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                   = "standard"
  purge_protection_enabled   = false
  soft_delete_retention_days = 30

  public_network_access_enabled = true
}
