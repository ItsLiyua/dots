{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.desktop.wm.niri.enable {
    programs.niri = {
      enable = true;
      settings = {
        binds = {
          "Mod+A".action.spawn = "${pkgs.wofi}/bin/wofi --show drun";
          "Mod+T".action.spawn = "${pkgs.foot}/bin/foot";
        };
      };
    };
    stylix.targets.niri.enable = true;
  };
}
