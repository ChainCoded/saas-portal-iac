# modules/s3/variables.tf

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Whether to enable bucket versioning"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Allow Terraform to destroy bucket even if it contains objects"
  type        = bool
  default     = false
}