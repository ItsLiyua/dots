{
  nixpkgs,
  lib,
  pkgs,
}:
final: prev: {
  alsa-ucm-conf =
    (nixpkgs.legacyPackages.${pkgs.system}.applyPatches {
      name = "nixpkgs-patched-392058";
      src = nixpkgs;
      patches = pkgs.fetchpatch {
        name = "pr-392058";
        url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/392058.patch";
      };
    }).legacyPackages.${pkgs.system}.alsa-ucm-conf;
}
