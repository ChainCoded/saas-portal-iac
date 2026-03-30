module "monitoring" {
  source = "../../modules/monitoring"

  name_prefix = local.name_prefix
  alert_email = var.alert_email
}

module "budget_alerts" {
  source = "../../modules/budget_alerts"

  name_prefix     = local.name_prefix
  alarm_threshold = var.billing_alarm_threshold
  sns_topic_arn   = module.monitoring.sns_topic_arn
}

# Child modules will be added here as the project is built out.
