output "project_name" {
  description = "The project name for this environment."
  value       = var.project_name
}

output "environment" {
  description = "The deployment environment."
  value       = var.environment
}

output "aws_region" {
  description = "The AWS region used by this environment."
  value       = var.aws_region
}

output "name_prefix" {
  description = "Common naming prefix for resources."
  value       = local.name_prefix
}

output "alerts_sns_topic_arn" {
  description = "SNS topic ARN used for environment alerts."
  value       = module.monitoring.sns_topic_arn
}

output "alerts_sns_topic_name" {
  description = "SNS topic name used for environment alerts."
  value       = module.monitoring.sns_topic_name
}

output "billing_alarm_name" {
  description = "CloudWatch billing alarm name."
  value       = module.budget_alerts.billing_alarm_name
}

output "billing_alarm_arn" {
  description = "CloudWatch billing alarm ARN."
  value       = module.budget_alerts.billing_alarm_arn
}