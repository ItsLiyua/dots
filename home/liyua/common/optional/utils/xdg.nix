{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg = lib.mkIf config.liyua.xdg.enable {
    portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        hyprland.preferred = [
          "hyprland"
          "gtk"
        ];
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
