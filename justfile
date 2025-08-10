rebuild:
  just system
  just home

update-rebuild:
  just update
  just rebuild

pre-build:
  git add *.nix

system:
  just pre-build
  nh os switch

home:
  just pre-build
  nh home switch

update:
  nix flake update
