default:
    just --list

init:
    tofu init

plan:
    tofu plan -target=module.semesta -target=module.galaksi -target=module.samudera -target=module.pabrik_tahu

apply:
    tofu apply -target=module.semesta -target=module.galaksi -target=module.samudera -target=module.pabrik_tahu

destroy:
    tofu destroy

fmt:
    tofu fmt -recursive

validate:
    tofu validate

refresh:
    tofu refresh -target=module.semesta -target=module.galaksi -target=module.samudera -target=module.pabrik_tahu

migrate-state:
    tofu state mv 'github_repository.pelindung_bumi_github_io' 'module.pelindung_bumi_github_io.github_repository.this'
    tofu state mv 'github_repository.semesta' 'module.semesta.github_repository.this'
    tofu state mv 'github_repository.galaksi' 'module.galaksi.github_repository.this'
    tofu state mv 'github_repository.peta' 'module.peta.github_repository.this'
    tofu state mv 'github_repository.samudera' 'module.samudera.github_repository.this'
    tofu state mv 'github_repository.pabrik_tahu' 'module.pabrik_tahu.github_repository.this'
