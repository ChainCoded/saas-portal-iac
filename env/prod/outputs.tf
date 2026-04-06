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

output "vpc_id" {
  description = "VPC ID for this environment"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.network.private_subnet_ids
}

output "app_security_group_id" {
  description = "Security group ID for the application"
  value       = module.security_groups.app_security_group_id
}

output "db_security_group_id" {
  description = "Security group ID for the database"
  value       = module.security_groups.db_security_group_id
}

output "app_instance_id" {
  description = "EC2 app instance ID"
  value       = module.ec2_app.instance_id
}

output "app_public_ip" {
  description = "Public IP address of the app instance"
  value       = module.ec2_app.public_ip
}

output "app_private_ip" {
  description = "Private IP address of the app instance"
  value       = module.ec2_app.private_ip
}

output "db_endpoint" {
  description = "RDS endpoint"
  value       = module.rds.db_endpoint
}

output "db_address" {
  description = "RDS address"
  value       = module.rds.db_address
}

output "db_port" {
  description = "RDS port"
  value       = module.rds.db_port
}

output "db_name" {
  description = "Database name"
  value       = module.rds.db_name
}

output "cognito_user_pool_id" {
  value = module.cognito.user_pool_id
}

output "cognito_app_client_id" {
  value = module.cognito.app_client_id
}

output "artifact_bucket_name" {
  description = "Artifact S3 bucket name"
  value       = module.artifact_bucket.bucket_name
}

output "artifact_bucket_arn" {
  description = "Artifact S3 bucket ARN"
  value       = module.artifact_bucket.bucket_arn
}