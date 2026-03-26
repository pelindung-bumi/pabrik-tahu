resource "github_repository" "this" {
  name         = var.name
  description  = var.description
  homepage_url = var.homepage_url
  visibility   = var.visibility
  has_issues   = var.has_issues
  has_projects = var.has_projects
  has_wiki     = var.has_wiki

  allow_squash_merge = true

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  dynamic "pages" {
    for_each = var.pages_cname != null ? [1] : []
    content {
      build_type = var.pages_build_type
      cname      = var.pages_cname
    }
  }
}
