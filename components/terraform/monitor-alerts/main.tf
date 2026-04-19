data "azurerm_virtual_network" "this" {
  count               = var.alert_type == "metric" ? 1 : 0
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

# ── DDoS Metric Alert ────────────────────────────────────────────────────────
resource "azurerm_monitor_metric_alert" "ddos" {
  count               = var.alert_type == "metric" ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = [data.azurerm_virtual_network.this[0].id]
  description         = var.description
  severity            = var.severity
  window_size         = var.window_size
  frequency           = var.frequency

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold
  }

  action {
    action_group_id = var.action_group_id
    webhook_properties = {
      alertSchema = "v5" # CDv5 webhook payload
    }
  }

  tags = var.tags
}

# ── Resource Health Alert ─────────────────────────────────────────────────────
resource "azurerm_monitor_activity_log_alert" "resource_health" {
  count               = var.alert_type == "resource_health" ? 1 : 0
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = ["/subscriptions/${var.subscription_id}"]
  description         = var.description

  criteria {
    category = "ResourceHealth"
    resource_health {
      current  = var.health_current_statuses
      previous = var.health_previous_statuses
      reason   = var.health_reasons
    }
  }

  action {
    action_group_id = var.action_group_id
  }

  tags = var.tags
}