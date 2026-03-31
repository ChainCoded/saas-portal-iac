variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "app_port" {
  description = "Port the application listens on"
  type        = number
  default     = 8080
}

variable "db_port" {
  description = "Port the database listens on"
  type        = number
  default     = 5432
}

variable "admin_cidr" {
  description = "CIDR block allowed temporary access to the app for testing"
  type        = string
}