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

variable "app_port" {
  description = "Port the application runs on"
  type        = number
  default     = 80
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "saasportal"
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
  default     = "postgresadmin"
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}

variable "artifact_bucket_name" {
  description = "Name of the S3 artifact bucket"
  type        = string
}

variable "github_token" {
  sensitive = true
}