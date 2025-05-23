{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./hyprland.nix
    ./lockscreen.nix
    ./idle.nix
    ./theme.nix
    # ./ags/ags.nix
    ./screenshot.nix
  ];
}
