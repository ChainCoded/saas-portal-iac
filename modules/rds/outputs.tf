# modules/rds/outputs.tf

output "db_instance_id" {
  description = "RDS instance ID"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.this.endpoint
}

output "db_address" {
  description = "RDS address"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "RDS port"
  value       = aws_db_instance.this.port
}

output "db_name" {
  description = "Database name"
  value       = aws_db_instance.this.db_name
}