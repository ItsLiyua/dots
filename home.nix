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
    inputs.zen-browser.packages."${system}".default
  ];
  home.file = {
    ".ssh/authorized_keys" = {
      text = ''
      ssh-key-here
      '';
    };
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [
    ./hyprland.nix
    ./git.nix
    # ./utils.nix
    ./apps.nix
  ];
}
