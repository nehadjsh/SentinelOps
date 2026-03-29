# --- GitHub Configuration ---
variable "github_repo" {
  description = "The full name of the GitHub repository (e.g., username/SentinelOps)"
  type        = string
}

# --- Networking & Security ---
variable "allowed_ip" {
  description = "Admin IP address for restricted access to Dashboards"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public Key for EC2 instance access"
  type        = string
}