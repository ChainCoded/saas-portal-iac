variable "aws_region" {
  description = "AWS region for all project resources."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming and tagging."
  type        = string
  default     = "saas-portal"
}

variable "environment" {
  description = "Deployment environment name."
  type        = string
  default     = "prod"
}

variable "alert_email" {
  description = "Email address to receive infrastructure and billing alerts."
  type        = string
  default     = "packetengineer3@gmail.com"
}

variable "billing_alarm_threshold" {
  description = "Estimated AWS charges threshold in USD for the billing alarm."
  type        = number
  default     = 25
}