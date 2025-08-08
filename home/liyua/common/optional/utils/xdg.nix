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
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
