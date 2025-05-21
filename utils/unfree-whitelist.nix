{ pkgs, lib, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "enhancer-for-youtube"
    "discord"
  ];
}
