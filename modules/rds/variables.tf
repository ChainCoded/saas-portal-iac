# modules/rds/variables.tf

variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "db_security_group_id" {
  description = "Security group ID for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_username" {
  description = "Master username for the database"
  type        = string
}

variable "db_password" {
  description = "Master password for the database"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
  default     = 20
}

variable "engine_version" {
  description = "PostgreSQL engine version"
  type        = string
  default     = "16.3"
}