resource "aws_cloudwatch_metric_alarm" "billing_estimated_charges" {
  alarm_name          = "${var.name_prefix}-billing-estimated-charges"
  alarm_description   = "Alerts when estimated AWS charges exceed the defined threshold."
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = 21600
  statistic           = "Maximum"
  threshold           = var.alarm_threshold
  alarm_actions       = [var.sns_topic_arn]
  ok_actions          = [var.sns_topic_arn]
  treat_missing_data  = "missing"

  dimensions = {
    Currency = "USD"
  }
}