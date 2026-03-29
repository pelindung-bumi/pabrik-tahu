terraform {
  required_version = ">= 1.8.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }

  backend "pg" {
    conn_str = "postgres://tofu:fpJt7tPFb7pfsWa5DocI7SgHhkVTIBc5eIXQUpP97YlVoGSDzHNvS8P4yrXF1FLH@localhost:5432/tofu_state"
  }
}

provider "github" {
  owner = "pelindung-bumi"
  app_auth {
    id              = var.github_app_id
    installation_id = var.github_app_installation_id
    pem_file        = file(var.github_app_pem_file)
  }
}
