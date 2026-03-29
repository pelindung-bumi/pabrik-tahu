# pabrik-tahu

Pabrik Tahu means "tofu factory" in Indonesian. This repo manages the [Pelindung Bumi](https://github.com/pelindung-bumi) GitHub organization as code using OpenTofu and a GitHub App.

Everything in the org — repositories, settings, visibility — is declared here and applied through OpenTofu.

## Stack

- [OpenTofu](https://opentofu.org) — open-source Terraform fork
- [GitHub Provider](https://registry.terraform.io/providers/integrations/github/latest/docs) (`integrations/github ~> 6.0`) — manages GitHub resources via API
- [Nix flake](https://zero-to-nix.com/concepts/flakes) + [devenv](https://devenv.sh) — reproducible dev environment
- [just](https://just.systems) — command runner
- [CloudNativePG](https://cloudnative-pg.io/) — PostgreSQL on Kubernetes for remote state backend

## How it works

OpenTofu reads the `.tofu` files, compares what's declared against what actually exists on GitHub, and makes the diff happen.

```
*.tofu files  →  tofu plan  →  tofu apply  →  GitHub API
```

State is stored remotely in a PostgreSQL database running on Kubernetes (CNPG), accessed via the `pg` backend.

## Managed repositories

| Repository | Description |
| :-- | :-- |
| [pelindung-bumi.github.io](https://github.com/pelindung-bumi/pelindung-bumi.github.io) | Blog — [pelindungbumi.dev](https://pelindungbumi.dev) |
| [semesta](https://github.com/pelindung-bumi/semesta) | Infrastructure managed declaratively with Nix |
| [galaksi](https://github.com/pelindung-bumi/galaksi) | Kubernetes manifests managed with GitOps |
| [peta](https://github.com/pelindung-bumi/peta) | Documentation — [docs.pelindungbumi.dev](https://docs.pelindungbumi.dev) |
| [samudera](https://github.com/pelindung-bumi/samudera) | Vendoring of Helm charts and CRDs |
| [pabrik-tahu](https://github.com/pelindung-bumi/pabrik-tahu) | This repo — IaC with OpenTofu |

## Prerequisites

- [Nix](https://nixos.org/download/) with flakes enabled
- Access to the Kubernetes cluster running the CNPG PostgreSQL instance
- A [GitHub App](https://docs.github.com/en/apps/creating-github-apps) installed on the `pelindung-bumi` org

## Getting started

### 1. Enter the dev shell

```bash
nix develop --no-pure-eval --command zsh
```

This provides OpenTofu, just, and git via devenv.

### 2. Set up the state backend

The state is stored in a PostgreSQL database managed by CloudNativePG on Kubernetes. You need to port-forward the database service:

```bash
export KUBECONFIG=~/.kube/pelindungbumi.yaml
kubectl config use-context default
kubectl port-forward -n cnpg-system svc/tofu-state-rw 5432:5432
```

Keep this running in a separate terminal.

### 3. Configure the GitHub App credentials

Copy the example tfvars and fill in your values:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars`:

```hcl
github_owner               = "pelindung-bumi"
github_app_id              = "YOUR_APP_ID"
github_app_installation_id = "YOUR_INSTALLATION_ID"
github_app_pem_file        = "path/to/your-app.private-key.pem"
```

You can find the App ID and Installation ID in the GitHub App settings page. Download the private key PEM file and place it in the project root.

### 4. Initialize and apply

```bash
just init    # download providers and initialize backend
just plan    # preview changes
just apply   # apply changes to GitHub
```

## Commands

| Command | Action |
| :-- | :-- |
| `just init` | Initialize backend and download providers |
| `just plan` | Preview what will change |
| `just apply` | Apply changes to GitHub |
| `just destroy` | Remove all managed resources |
| `just fmt` | Format all `.tofu` files recursively |
| `just validate` | Validate configuration |
| `just refresh` | Refresh state from GitHub |

## Project structure

```
├── flake.nix                            — Nix dev shell (devenv)
├── justfile                             — common commands
├── providers.tofu                       — OpenTofu backend + GitHub provider config
├── variables.tofu                       — input variables
├── repositories.tofu                    — repository declarations (modules)
├── outputs.tofu                         — output values (repository URLs)
├── terraform.tfvars.example             — secret template (copy to terraform.tfvars)
└── modules/
    └── github-repository/
        ├── main.tofu                    — github_repository resource
        ├── variables.tofu               — module input variables
        └── outputs.tofu                 — module outputs (name, full_name, html_url)
```

## Adding a new repository

1. Add a module block in `repositories.tofu`:

   ```hcl
   module "my_new_repo" {
     source      = "./modules/github-repository"
     name        = "my-new-repo"
     description = "Description of the repository"
     auto_init   = true  # creates the repo with a README
   }
   ```

2. Initialize the new module:

   ```bash
   just init
   ```

3. Preview and apply:

   ```bash
   tofu plan -target=module.my_new_repo
   tofu apply -target=module.my_new_repo
   ```

4. If the repo already exists on GitHub, import it instead:

   ```bash
   tofu import module.my_new_repo.github_repository.this my-new-repo
   ```

### Module variables

| Variable | Type | Default | Description |
| :-- | :-- | :-- | :-- |
| `name` | `string` | (required) | Repository name |
| `description` | `string` | `null` | Repository description |
| `homepage_url` | `string` | `null` | Repository homepage URL |
| `visibility` | `string` | `"public"` | Repository visibility (`public` or `private`) |
| `has_issues` | `bool` | `true` | Enable issues |
| `has_projects` | `bool` | `true` | Enable projects |
| `has_wiki` | `bool` | `true` | Enable wiki |
| `auto_init` | `bool` | `false` | Create with an initial README |

## References

- [OpenTofu docs](https://opentofu.org/docs)
- [GitHub provider docs](https://registry.terraform.io/providers/integrations/github/latest/docs)
- [github_repository resource](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository)
- [CloudNativePG docs](https://cloudnative-pg.io/documentation/)
