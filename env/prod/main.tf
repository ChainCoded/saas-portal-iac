module "monitoring" {
  source = "../../modules/monitoring"

  name_prefix = local.name_prefix
  alert_email = var.alert_email
}

module "budget_alerts" {
  source = "../../modules/budget_alerts"

  name_prefix     = local.name_prefix
  alarm_threshold = var.billing_alarm_threshold
  sns_topic_arn   = module.monitoring.sns_topic_arn
}

module "network" {
  source = "../../modules/network"

  name_prefix          = local.name_prefix
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "security_groups" {
  source = "../../modules/security_groups"

  name_prefix = local.name_prefix
  vpc_id      = module.network.vpc_id
  app_port    = var.app_port
  db_port     = var.db_port
}

module "ec2_app" {
  source = "../../modules/ec2_app"

  name_prefix       = local.name_prefix
  subnet_id         = module.network.public_subnet_ids[0]
  security_group_id = module.security_groups.app_security_group_id
  instance_type     = "t3.micro"
  app_port          = var.app_port
}

module "rds" {
  source = "../../modules/rds"

  name_prefix          = local.name_prefix
  private_subnet_ids   = module.network.private_subnet_ids
  db_security_group_id = module.security_groups.db_security_group_id

  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  instance_class     = var.db_instance_class
  allocated_storage  = var.db_allocated_storage
}

module "cognito" {
  source = "../../modules/cognito"

  name_prefix = local.name_prefix
}

module "artifact_bucket" {
  source = "../../modules/s3"

  bucket_name       = var.artifact_bucket_name
  enable_versioning = true
  force_destroy     = false
}

module "codedeploy" {
  source      = "../../modules/codedeploy"
  name_prefix = local.name_prefix
}

module "cicd" {
  source = "../../modules/cicd"

  name_prefix = local.name_prefix

  artifact_bucket = module.artifact_bucket.bucket_name

  codedeploy_app_name         = module.codedeploy.app_name
  codedeploy_deployment_group = module.codedeploy.deployment_group_name

  github_repo   = "your-repo-name"
  github_branch = "main"

  github_token = var.github_token
}