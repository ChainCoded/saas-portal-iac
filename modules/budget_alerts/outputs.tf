output "billing_alarm_name" {
  description = "Name of the CloudWatch billing alarm."
  value       = aws_cloudwatch_metric_alarm.billing_estimated_charges.alarm_name
}

output "billing_alarm_arn" {
  description = "ARN of the CloudWatch billing alarm."
  value       = aws_cloudwatch_metric_alarm.billing_estimated_charges.arn
}