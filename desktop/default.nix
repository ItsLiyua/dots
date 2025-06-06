{ config, lib, ... }:
{
  imports = [
    ./hyprland
    ./lockscreen.nix
    ./idle.nix
    ./theme.nix
    ./screenshot.nix
    ./ags/ags.nix
    ./screenRotation.nix
    ./background.nix
  ];
  options.liyua.desktop.enable = lib.mkEnableOption "Graphical Session";
  config.liyua.desktop = with config.liyua.desktop; {
    hyprland.enable = lib.mkDefault enable;
    screenRotation.enable = lib.mkDefault false;
    lockscreen.enable = lib.mkDefault enable;
    idle.enable = lib.mkDefault enable;
    theme.enable = lib.mkDefault enable;
    screenshot.enable = lib.mkDefault enable;
    bar.enable = lib.mkDefault enable;
    wallpaper = {
      enable = lib.mkDefault enable;
      gen.enable = lib.mkDefault enable;
    };
  };
}
