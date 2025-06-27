{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.xdg = lib.mkIf config.liyua.xdg.enable {
    portal =
      {
        enable = true;
      }
      // lib.mkIf config.liyua.desktop.wm.hyprland.enable {
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
