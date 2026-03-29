module "pelindung_bumi_github_io" {
  source       = "./modules/github-repository"
  name         = "pelindung-bumi.github.io"
  homepage_url = "https://pelindungbumi.dev/"
}

module "semesta" {
  source      = "./modules/github-repository"
  name        = "semesta"
  description = "Semesta(Universe in english) the place for the whole infrastructure, managed declaratively with nix"
}

module "galaksi" {
  source      = "./modules/github-repository"
  name        = "galaksi"
  description = "Galaksi is the place for managing kubernetes manifest with gitops"
}

module "peta" {
  source       = "./modules/github-repository"
  name         = "peta"
  description  = "Peta is the documentation page, a map for all of Para Pelindung Bumi"
  homepage_url = "https://docs.pelindungbumi.dev/"
}

module "samudera" {
  source      = "./modules/github-repository"
  name        = "samudera"
  description = "Samudera is bahasa indonesia of ocean, this repository is place to do vendoring of helm charts and crds"
}

module "pabrik_tahu" {
  source      = "./modules/github-repository"
  name        = "pabrik-tahu"
  description = "Pabrik Tahu is bahasa Indonesia of tofu factory. This repository is place for managing IaC with Opentofu/Terraform(mostly will be Opentofu)"
}

module "test_new_repo" {
  source      = "./modules/github-repository"
  name        = "test-new-repo"
  description = "Test new repository"
  auto_init   = true
}
