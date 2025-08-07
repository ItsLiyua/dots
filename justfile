rebuild:
  just system
  just home

update-rebuild:
  just update
  just rebuild

system:
  nh os switch

home:
  nh home switch

update:
  nix flake update
