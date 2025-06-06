{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.utils.xdg.enable = lib.mkEnableOption "XDG configuration";
  config.xdg = lib.mkIf config.liyua.utils.xdg.enable {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config.hyprland.preferred = [
        "hyprland"
        "gtk"
      ];
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
