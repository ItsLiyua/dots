{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./desktop
    ./utils
    ./apps
    ./nvim
  ];
  config = {
    home.username = "liyua";
    home.homeDirectory = "/home/liyua";
    home.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
    home.packages = with pkgs; [
      wofi
      brightnessctl
      playerctl
    ];
    programs.home-manager.enable = true;
    liyua = {
      apps.enable = lib.mkDefault true;
      cli.enable = lib.mkDefault true;
      desktop.enable = lib.mkDefault true;
      nvim.enable = lib.mkDefault true;
      utils.enable = lib.mkDefault true;
    };
  };
}
