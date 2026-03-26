default:
    just --list

init:
    tofu init

plan:
    tofu plan

apply:
    tofu apply

destroy:
    tofu destroy

fmt:
    tofu fmt -recursive

validate:
    tofu validate

migrate-state:
    tofu state mv 'github_repository.pelindung_bumi_github_io' 'module.pelindung_bumi_github_io.github_repository.this'
    tofu state mv 'github_repository.semesta' 'module.semesta.github_repository.this'
    tofu state mv 'github_repository.galaksi' 'module.galaksi.github_repository.this'
    tofu state mv 'github_repository.peta' 'module.peta.github_repository.this'
    tofu state mv 'github_repository.samudera' 'module.samudera.github_repository.this'
    tofu state mv 'github_repository.pabrik_tahu' 'module.pabrik_tahu.github_repository.this'
