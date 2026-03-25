# pabrik-tahu

Pabrik Tahu means "tofu factory" in Indonesian. This repo manages the Pelindung Bumi GitHub organization as code using OpenTofu and the GitHub provider.

Everything in the org — repositories, members, teams — is declared here and applied through OpenTofu.

## Stack

- [OpenTofu](https://opentofu.org) — open-source Terraform fork
- [GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs) — manages GitHub resources via API
- [Nix flake](https://zero-to-nix.com/concepts/flakes) — reproducible dev environment
- [just](https://just.systems) — command runner

## How it works

OpenTofu reads the `.tf` files, compares what's declared against what actually exists on GitHub, and makes the diff happen.

```
*.tf files  →  tofu plan  →  tofu apply  →  GitHub API
```

The state file tracks what OpenTofu manages. Never commit `*.tfstate` or `*.tfvars`.

## Dev environment

Enter the dev shell with Nix:

```bash
nix develop --no-pure-eval --command zsh
```

This provides OpenTofu, just, and git at pinned versions.

## Getting started

```bash
# Copy and fill in your GitHub token
cp terraform.tfvars.example terraform.tfvars

# Initialize the GitHub provider
just init

# Preview changes
just plan

# Apply changes
just apply
```

Your GitHub token needs `repo` and `admin:org` scopes.

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
├── flake.nix                  — Nix dev shell
├── justfile                   — common commands
├── providers.tf               — OpenTofu + GitHub provider config
├── variables.tf               — input variables
├── repositories.tf            — org repositories
└── terraform.tfvars.example   — secret template (copy to terraform.tfvars)
```

## References

- [OpenTofu docs](https://opentofu.org/docs)
- [GitHub provider docs](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [github_repository resource](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
