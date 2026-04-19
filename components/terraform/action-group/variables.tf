variable "name" {
  type        = string
  description = "Name of the action group"
}

variable "resource_group_name" {
  type = string
}

variable "short_name" {
  type        = string
  description = "Max 12 characters — shown in SMS/email subject lines"
  validation {
    condition     = length(var.short_name) <= 12
    error_message = "short_name must be 12 characters or fewer."
  }
}

variable "alert_email" {
  type        = string
  description = "Email address to notify on alert"
}

variable "use_common_alert_schema" {
  type        = bool
  default     = true
  description = "Enables CDv5 Common Alert Schema"
}

variable "tags" {
  type    = map(string)
  default = {}
}