variable "name" {
  description = "Repository name"
  type        = string
}

variable "description" {
  description = "Repository description"
  type        = string
  default     = null
}

variable "homepage_url" {
  description = "Repository homepage URL"
  type        = string
  default     = null
}

variable "visibility" {
  description = "Repository visibility"
  type        = string
  default     = "public"
}

variable "has_issues" {
  description = "Enable issues"
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Enable projects"
  type        = bool
  default     = true
}

variable "has_wiki" {
  description = "Enable wiki"
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "Create repository with an initial README"
  type        = bool
  default     = false
}

