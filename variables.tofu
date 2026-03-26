variable "github_owner" {
  description = "GitHub organization name"
  type        = string
  default     = "pelindung-bumi"
}

variable "github_app_id" {
  description = "GitHub App ID"
  type        = string
}

variable "github_app_installation_id" {
  description = "GitHub App installation ID for the organization"
  type        = string
}

variable "github_app_pem_file" {
  description = "Path to the GitHub App private key PEM file"
  type        = string
  sensitive   = true
}
