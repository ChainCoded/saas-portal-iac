variable "name_prefix" {
  description = "Common naming prefix for budget and billing alert resources."
  type        = string
}

variable "alarm_threshold" {
  description = "Estimated charges threshold in USD that triggers the billing alarm."
  type        = number
}

variable "sns_topic_arn" {
  description = "SNS topic ARN to notify when the billing alarm is triggered."
  type        = string
}