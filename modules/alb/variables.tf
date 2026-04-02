# modules/alb/variables.tf

variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB target group will live"
  type        = string
}

variable "public_subnet_ids" {
  description = "Public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "app_instance_id" {
  description = "EC2 instance ID for the app server"
  type        = string
}

variable "app_port" {
  description = "Port the app listens on"
  type        = number
}