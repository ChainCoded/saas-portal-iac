variable "name_prefix" {
  description = "Common naming prefix for monitoring resources."
  type        = string
}

variable "alert_email" {
  description = "Email address to subscribe to monitoring alerts."
  type        = string
}