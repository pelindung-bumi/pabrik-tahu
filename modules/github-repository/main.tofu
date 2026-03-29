terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

resource "github_repository" "this" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url
  visibility   = var.visibility
  has_issues   = var.has_issues
  has_projects = var.has_projects
  has_wiki     = var.has_wiki
  auto_init    = var.auto_init

  allow_squash_merge = true

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  lifecycle {
    ignore_changes = [pages]
  }
}
