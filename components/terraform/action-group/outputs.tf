output "action_group_id" {
  description = "Resource ID — consumed by monitor-alerts via remote state"
  value       = azurerm_monitor_action_group.this.id
}

output "action_group_name" {
  value = azurerm_monitor_action_group.this.name
}