output "subscription_id" {
  value = data.azurerm_subscription.current.id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.network.id
}

output "policy_assignments" {
  value = {
    no_public_ip_nic = azurerm_subscription_policy_assignment.no_public_ip_nic.id
    subnet_nsg       = azurerm_subscription_policy_assignment.subnet_nsg.id
    network_watcher_enabled     = azurerm_subscription_policy_assignment.network_watcher_enabled.id
    nsg_flow_logs_enabled    =  azurerm_subscription_policy_assignment.nsg_flow_logs_enabled.id
    }
}
