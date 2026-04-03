# modules/cognito/variables.tf

variable "name_prefix" {
  description = "Prefix used for naming resources"
  type        = string
}

variable "callback_urls" {
  description = "Allowed callback URLs after login"
  type        = list(string)
  default     = ["http://localhost:3000"]
}

variable "logout_urls" {
  description = "Allowed logout URLs"
  type        = list(string)
  default     = ["http://localhost:3000"]
}