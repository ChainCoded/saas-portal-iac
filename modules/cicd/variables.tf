variable "name_prefix" {
  type = string
}

variable "artifact_bucket" {
  type = string
}

variable "codedeploy_app_name" {
  type = string
}

variable "codedeploy_deployment_group" {
  type = string
}

variable "github_full_repository_id" {
  description = "GitHub repo in owner/repo format"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch to track"
  type        = string
  default     = "main"
}

variable "connection_arn" {
  description = "CodeConnections ARN for GitHub source"
  type        = string
}

variable "aws_region" {
  type = string
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for CI/CD alerts"
  type        = string
}