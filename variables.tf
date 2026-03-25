variable "github_owner" {
  description = "GitHub organization name"
  type        = string
  default     = "pelindung-bumi"
}

variable "github_token" {
  description = "GitHub personal access token with org admin permissions"
  type        = string
  sensitive   = true
}
