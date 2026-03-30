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