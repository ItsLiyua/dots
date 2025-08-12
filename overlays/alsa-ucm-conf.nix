{ nixpkgs-staging, ... }:
final: prev: {
  alsa-ucm-conf = nixpkgs-staging.legacyPackages.${final.system}.alsa-ucm-conf; # TODO: Remove hardcoded version
}
