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
          "Mod+A".action.spawn = [
            "${pkgs.wofi}/bin/wofi"
            "--show"
            "drun"
          ];
          "Mod+T".action.spawn = "${pkgs.foot}/bin/foot";
          "Mod+F".action.spawn = "firefox";

        };
        input = {
          keyboard.xkb.layout = "de";
          touchpad = {

          };
          mouse.accel-profile = "flat";
          focus-follows-mouse.enable = true;
        };
        outputs."eDP-1" = {
          scale = 1;
          mode = {
            height = 1920;
            width = 1080;
            refresh = 60.0;
          };
        };
      };
    };
    stylix.targets.niri.enable = true;
  };
}
