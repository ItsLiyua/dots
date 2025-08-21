rebuild:
  just system
  just home

pre-build:
  git add *.nix
  git add *.pub
  git add *.tsx
  git add *.scss

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

