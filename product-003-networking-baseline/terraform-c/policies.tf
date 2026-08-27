locals {
  policy_scope = data.azurerm_subscription.current.id
}

resource "azurerm_subscription_policy_assignment" "no_public_ip_nic" {
  name                 = "p003-no-public-ip-nic"
  display_name         = "Network interfaces should not have public IPs"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/83a86a26-fd1f-447c-b59d-e51f44264114"
  subscription_id      = data.azurerm_subscription.current.id
}

resource "azurerm_subscription_policy_assignment" "subnet_nsg" {
  name                 = "p003-subnet-nsg"
  display_name         = "Subnets should be associated with a Network Security Group"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/e71308d3-144b-4262-b144-efdc3cc90517"
  subscription_id      = data.azurerm_subscription.current.id
}

resource "azurerm_subscription_policy_assignment" "network_watcher_enabled" {
  name                 = "p003-NetWatchEn" 
  display_name         = "Network Watcher should be enabled"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/b6e2945c-0b7b-40f5-9233-7a5323b5cdc6"
  subscription_id      = data.azurerm_subscription.current.id
}

resource "azurerm_subscription_policy_assignment" "nsg_flow_logs_enabled" {
  name                 = "p003-nsg_flow_logs_enabled" 
  display_name         = "Flow logs should be configured for every network security group" # 128char
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/c251913d-7d24-4958-af87-478ed3b9ba41"
  subscription_id      = data.azurerm_subscription.current.id
}
