# pabrik-tahu

Pabrik Tahu means "tofu factory" in Indonesian. This repo manages the [Pelindung Bumi](https://github.com/pelindung-bumi) GitHub organization as code using OpenTofu and a GitHub App.

Everything in the org — repositories, members, teams — is declared here and applied through OpenTofu.

## Stack

- [OpenTofu](https://opentofu.org) — open-source Terraform fork
- [GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs) — manages GitHub resources via API
- [Nix flake](https://zero-to-nix.com/concepts/flakes) + [devenv](https://devenv.sh) — reproducible dev environment
- [just](https://just.systems) — command runner

## How it works

OpenTofu reads the `.tf` files, compares what's declared against what actually exists on GitHub, and makes the diff happen.

```
*.tf files  →  tofu plan  →  tofu apply  →  GitHub API
```

The state file tracks what OpenTofu manages. Never commit `*.tfstate` or `*.tfvars`.

## Managed repositories

| Repository | Description |
| :-- | :-- |
| [pelindung-bumi.github.io](https://github.com/pelindung-bumi/pelindung-bumi.github.io) | Blog — [pelindungbumi.dev](https://pelindungbumi.dev) |
| [semesta](https://github.com/pelindung-bumi/semesta) | Infrastructure managed declaratively with Nix |
| [galaksi](https://github.com/pelindung-bumi/galaksi) | Kubernetes manifests managed with GitOps |
| [peta](https://github.com/pelindung-bumi/peta) | Documentation — [docs.pelindungbumi.dev](https://docs.pelindungbumi.dev) |
| [samudera](https://github.com/pelindung-bumi/samudera) | Vendoring of Helm charts and CRDs |
| [pabrik-tahu](https://github.com/pelindung-bumi/pabrik-tahu) | This repo — IaC with OpenTofu |

## Dev environment

Enter the dev shell with Nix:

```bash
nix develop --no-pure-eval --command zsh
```

This provides OpenTofu, just, and git via devenv.

## Getting started

1. Create a [GitHub App](https://docs.github.com/en/apps/creating-github-apps) and install it on the org.

2. Copy and fill in the secrets:

   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

   You need `github_app_id`, `github_app_installation_id`, and the path to the PEM private key.

3. Initialize and apply:

   ```bash
   just init
   just plan
   just apply
   ```

## Commands

| Command | Action |
| :-- | :-- |
| `just init` | Download provider plugins |
| `just plan` | Preview what will change |
| `just apply` | Apply changes to GitHub |
| `just destroy` | Remove all managed resources |
| `just fmt` | Format all `.tf` files |
| `just validate` | Validate configuration |

## Structure

```
├── flake.nix                  — Nix dev shell (devenv)
├── justfile                   — common commands
├── providers.tf               — OpenTofu + GitHub provider config
├── variables.tf               — input variables
├── repositories.tf            — org repositories
└── terraform.tfvars.example   — secret template (copy to terraform.tfvars)
```

## Adding a new repository

1. Add a `github_repository` resource block in `repositories.tf`.
2. If the repo already exists on GitHub, import it first:
   ```bash
   tofu import github_repository.<resource_name> <repo-name>
   ```
3. Run `just plan` to verify, then `just apply`.

## References

- [OpenTofu docs](https://opentofu.org/docs)
- [GitHub provider docs](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [github_repository resource](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
