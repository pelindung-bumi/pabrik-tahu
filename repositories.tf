resource "github_repository" "pelindung_bumi_github_io" {
  name         = "pelindung-bumi.github.io"
  description  = "Pelindung Bumi blog — infra stuff, written down."
  visibility   = "public"
  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = ["astro", "blog", "infrastructure", "kubernetes"]
}

resource "github_repository" "semesta" {
  name         = "semesta"
  description  = "Infrastructure managed declaratively with Nix"
  visibility   = "public"
  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = ["nix", "nixos", "infrastructure", "colmena"]
}

resource "github_repository" "galaksi" {
  name         = "galaksi"
  description  = "Kubernetes cluster managed with ArgoCD"
  visibility   = "public"
  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = ["kubernetes", "argocd", "gitops"]
}

resource "github_repository" "pabrik_tahu" {
  name         = "pabrik-tahu"
  description  = "IaC with OpenTofu — managing GitHub as code"
  visibility   = "public"
  has_issues   = true
  has_projects = false
  has_wiki     = false

  topics = ["opentofu", "terraform", "iac", "github"]
}
