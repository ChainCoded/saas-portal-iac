variable "name_prefix" {}
variable "artifact_bucket" {}
variable "codedeploy_app_name" {}
variable "codedeploy_deployment_group" {}
variable "github_repo" {}
variable "github_branch" {
  default = "main"
}