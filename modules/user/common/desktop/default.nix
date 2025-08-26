{ lib, ... }:
{
  imports = [ ./wallpaper ];
  options.liyua.desktop = {
    displays = lib.mkOption {
      type =
        with lib.types;
        (attrsOf (submodule {
          options = {
            width = lib.mkOption { type = ints.positive; };
            height = lib.mkOption { type = ints.positive; };
            refreshRate = lib.mkOption {
              type = float;
              default = 60;
            };
            scale = lib.mkOption {
              type = lib.types.float;
              default = 1.0;
            };
            pos = {
              x = lib.mkOption {
                type = int;
                default = 0;
              };
              y = lib.mkOption {
                type = int;
                default = 0;
              };
            };
          };
        }));
      default = { };
    };
    layout = lib.mkOption {
      type = lib.types.str;
      default = "us";
    };
    wm.niri.enable = lib.mkEnableOption "Niri Scrollable WM";
    idle = {
      enable = lib.mkEnableOption "Desktop idle service";
      suspend = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to fully suspend device or just turn off displays when idling";
      };
    };
    lockscreen.enable = lib.mkEnableOption "Lockscreen";
    screenshot.enable = lib.mkEnableOption "Screenshot utility";
    theming.enable = lib.mkEnableOption "Desktop theming";
    ags.enable = lib.mkEnableOption "Desktop Shell";
  };
}
