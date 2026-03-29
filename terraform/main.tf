# --- OIDC Identity Provider for GitHub ---
# This resource establishes trust between AWS and GitHub Actions
resource "aws_iam_openid_connect_provider" "github" {
  url             = "https://token.actions.githubusercontent.com"
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1", "1c5877302383820603a991fc11903e06da1b6a09"]
}

# --- IAM Role for GitHub Actions ---
# Defines who can assume this role and under what conditions (Targeting your specific repo)
resource "aws_iam_role" "github_actions_role" {
  name = "SentinelOps-GitHub-OIDC-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Condition = {
          StringLike = {
            # Strictly limit access to your SentinelOps repository only
            "token.actions.githubusercontent.com:sub" = "repo:${var.github_repo}:*"
          }
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

# --- Permissions Attachment ---
# Attaching policies to the OIDC Role (PowerUserAccess for full Infrastructure management)
resource "aws_iam_role_policy_attachment" "github_actions_attach" {
  role       = aws_iam_role.github_actions_role.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}