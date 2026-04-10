# saas-portal-iac
SaaS Portal Infrastructure (AWS + Terraform)
Overview

This project simulates a production-style SaaS environment built entirely using Infrastructure as Code (IaC) with Terraform.

The goal is to demonstrate real-world cloud engineering and cloud support skills, including infrastructure provisioning, CI/CD automation, monitoring, and cost control—while operating within AWS Free Tier and credit constraints.

Objectives
-Build a realistic AWS environment using Terraform (HCP Terraform)
-Simulate a small SaaS application with authentication and database integration
-Implement CI/CD workflows for application deployment
-Operate and evolve infrastructure over a 30-day period
-Maintain strict cost control using AWS budgets and monitoring

Architecture
Current State
User → Internet → EC2 (Public Subnet) → Application (Port 8080)
Target Architecture
User → ALB → EC2 (Private Subnet) → Application → RDS (PostgreSQL)

Technologies Used
AWS Services:
VPC (network isolation)
EC2 (application hosting)
RDS PostgreSQL (database)
IAM (roles and access control)
S3 (artifact storage)
CloudWatch (monitoring & logs)
SNS (alerting)
AWS Budgets (cost control)
Cognito (authentication)
CodePipeline / CodeBuild / CodeDeploy (CI/CD)
Infrastructure as Code:
Terraform (HCP Terraform)
Remote state management
Modular architecture
GitHub-integrated workflows
Environment-based structure

Project Structure
env/prod/
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
  ├── providers.tf
  ├── versions.tf

modules/
  ├── network/
  ├── security_groups/
  ├── ec2_app/
  ├── rds/
  ├── s3/
  ├── cognito/
  ├── codedeploy/
  ├── alb/
  ├── monitoring/
  ├── budget_alerts/

Security Design
Least-privilege IAM roles
No secrets stored in GitHub
Security groups restrict:
Admin access (temporary CIDR)
Application traffic (future ALB-only access)
Designed for future private subnet migration
Monitoring & Cost Control
CloudWatch metrics and alarms
SNS email alerts
AWS Budget with threshold alerts
Billing alarm for real-time cost visibility

CI/CD Pipeline
Source: GitHub (trigger on push to main)
Build: AWS CodeBuild (artifact packaging)
Deploy: AWS CodeDeploy (EC2 deployment)
Infrastructure managed via Terraform Cloud
Components:
CodePipeline (orchestration)
CodeBuild (build process)
CodeDeploy (deployment to EC2)

Key Engineering Decisions
-Avoided NAT Gateway to reduce cost
-Used Terraform Cloud for remote execution and state management
-Modularized infrastructure for scalability and reuse
-Implemented cost guardrails before provisioning resources
-Delayed ALB and autoscaling to balance cost vs complexity
Challenges & Solutions
1. Terraform Dependency Issues
Resolved resource ordering conflicts between ALB, SGs, and EC2
2. Resource Replacement (ForceNew)
Prevented unnecessary infrastructure rebuilds by aligning state
3. AWS Free Tier Constraints
Switched instance types and optimized architecture to stay within limits

Roadmap
 Implement Application Load Balancer (ALB)
 Move EC2 to private subnet
 Add Auto Scaling Group
 Enable HTTPS (ACM + domain)
 Expand monitoring and logging
 Integrate GitHub-triggered deployments

Author

Marcus Garcia
Cloud Engineer | AWS | Terraform | Networking
