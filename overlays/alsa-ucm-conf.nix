{ nixpkgs-staging, ... }:
final: prev: {
  alsa-ucm-conf = nixpkgs-staging.legacyPackages.x86_64-linux.alsa-ucm-conf; # TODO: Remove hardcoded version
}
