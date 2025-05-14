{ config, pkgs, inputs, ... }:

{
  home.username = "liyua";
  home.homeDirectory = "/home/liyua";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.packages = with pkgs; [
    foot
    wofi
    inputs.zen-browser.packages."${system}".default
  ];
  home.file = {};
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
