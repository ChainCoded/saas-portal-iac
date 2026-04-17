output "github_connection_arn" {
  value       = aws_codestarconnections_connection.github.arn
  description = "ARN of the GitHub CodeConnections connection"
}