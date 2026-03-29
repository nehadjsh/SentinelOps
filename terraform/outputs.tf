# --- Security & CI/CD Outputs ---
# This ARN is used in GitHub Actions to assume the OIDC role
output "github_actions_role_arn" {
  description = "The ARN of the IAM role for GitHub Actions OIDC authentication"
  value       = aws_iam_role.github_actions_role.arn
}

# --- Connectivity Outputs ---
# This IP is dynamically captured by the CI/CD pipeline for Ansible execution
output "monitoring_server_public_ip" {
  description = "The public IP address of the monitoring server"
  value       = aws_instance.monitor_srv.public_ip
}