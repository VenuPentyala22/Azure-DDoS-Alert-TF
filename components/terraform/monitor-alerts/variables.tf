variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "description" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "alert_type" {
  type = string
  validation {
    condition     = contains(["metric", "resource_health"], var.alert_type)
    error_message = "alert_type must be 'metric' or 'resource_health'."
  }
}

# Remote state — action group
variable "action_group_id" {
  type        = string
  description = "Injected via remote_state from action-group component"
}

# Metric alert vars
variable "vnet_name" {
  type    = string
  default = null
}

variable "metric_namespace" {
  type    = string
  default = null
}

variable "metric_name" {
  type    = string
  default = null
}

variable "aggregation" {
  type    = string
  default = "Maximum"
}

variable "operator" {
  type    = string
  default = "GreaterThan"
}

variable "threshold" {
  type    = number
  default = 0
}

variable "severity" {
  type    = number
  default = 1
}

variable "window_size" {
  type    = string
  default = "PT5M"
}

variable "frequency" {
  type    = string
  default = "PT1M"
}

# Resource health vars
variable "subscription_id" {
  type    = string
  default = null
}

variable "health_current_statuses" {
  type    = list(string)
  default = []
}

variable "health_previous_statuses" {
  type    = list(string)
  default = []
}

variable "health_reasons" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}