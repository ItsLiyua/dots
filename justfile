rebuild:
  just system
  just home

pre-build:
  git add **/*.nix
  git add **/*.tsx
  git add **/*.yaml
  git add **/*.pub

system:
  just pre-build
  nh os switch

home:
  just pre-build
  nh home switch

update:
  nix flake update

alias r := rebuild
alias u := update
alias s := system
alias h := home

