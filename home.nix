{ config, pkgs, inputs, ... }:
{
  home.username = "liyua";
  home.homeDirectory = "/home/liyua";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    foot
    wofi
    brightnessctl
    playerctl
  ];
  programs.home-manager.enable = true;

  imports = [
    inputs.nur.modules.homeManager.default
    ./desktop.nix
    ./utils.nix
    ./apps.nix
  ];
}
