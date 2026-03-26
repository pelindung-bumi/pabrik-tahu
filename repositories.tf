resource "github_repository" "pelindung_bumi_github_io" {
  name         = "pelindung-bumi.github.io"
  homepage_url = "https://pelindungbumi.dev/"
  visibility   = "public"
  has_issues   = true
  has_projects = true
  has_wiki     = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  pages {
    build_type = "workflow"
    cname      = "pelindungbumi.dev"
  }
}

resource "github_repository" "semesta" {
  name        = "semesta"
  description = "Semesta(Universe in english) the place for the whole infrastructure, managed declaratively with nix"
  visibility  = "public"
  has_issues  = true
  has_projects = true
  has_wiki     = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
}

resource "github_repository" "galaksi" {
  name        = "galaksi"
  description = "Galaksi is the place for managing kubernetes manifest with gitops"
  visibility  = "public"
  has_issues  = true
  has_projects = true
  has_wiki     = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
}

resource "github_repository" "peta" {
  name         = "peta"
  description  = "Peta is the documentation page, a map for all of Para Pelindung Bumi"
  homepage_url = "https://docs.pelindungbumi.dev/"
  visibility   = "public"
  has_issues   = true
  has_projects = true
  has_wiki     = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"

  pages {
    build_type = "workflow"
    cname      = "docs.pelindungbumi.dev"
  }
}

resource "github_repository" "samudera" {
  name        = "samudera"
  description = "Samudera is bahasa indonesia of ocean, this repository is place to do vendoring of helm charts and crds"
  visibility  = "public"
  has_issues  = true
  has_projects = true
  has_wiki     = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
}

resource "github_repository" "pabrik_tahu" {
  name        = "pabrik-tahu"
  description = "Pabrik Tahu is bahasa Indonesia of tofu factory. This repository is place for managing IaC with Opentofu/Terraform(mostly will be Opentofu)"
  visibility  = "public"
  has_issues  = true
  has_projects = true
  has_wiki     = true

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = false

  merge_commit_message        = "PR_TITLE"
  merge_commit_title          = "MERGE_MESSAGE"
  squash_merge_commit_message = "COMMIT_MESSAGES"
  squash_merge_commit_title   = "COMMIT_OR_PR_TITLE"
}
