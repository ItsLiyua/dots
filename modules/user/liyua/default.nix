{ lib, ... }:
{
  options.liyua = {
    apps = {
      discord.enable = lib.mkEnableOption "Discord via Nixcord";
      firefox.enable = lib.mkEnableOption "Firefox";
      foot.enable = lib.mkEnableOption "Foot Terminal";
      nautilus.enable = lib.mkEnableOption "Nautilus File Manager";
      thunar.enable = lib.mkEnableOption "Thunar File Manager";
      prismlauncher.enable = lib.mkEnableOption "PrismLauncher for Minecraft";
      steam.enable = lib.mkEnableOption "Steam Game Store";
    };
    desktop = {
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
      bar.enable = lib.mkEnableOption "Bar";
      wallpaper = {
        enable = lib.mkEnableOption "Custom Wallpaper";
        type = lib.mkOption {
          type = lib.types.enum [
            "path"
            "nix"
          ];
          default = "nix";
        };
        splash = lib.mkOption {
          type = lib.types.bool;
          default = true;
        };
        path = lib.mkOption {
          type = with lib.types; (attrsOf str);
          description = "Monitors mapped to their respective wallpapers";
          example = "{ eDP-1 = \"/path/to/wallpaper-1.png\"; HDMI-A-1 = \"/path/to/another/wallpaper.jpg\"; }";
          default = { };
        };
        nix = {
          theme = lib.mkOption {
            type = lib.types.enum [
              "normal"
              "rainbow"
              "custom"
            ];
            default = "normal";
          };
          customColors = {
            background = lib.mkOption {
              type = lib.types.str;
              description = "Background color as hex without hashtag.";
            };
            color0 = lib.mkOption {
              type = lib.types.str;
              description = "First color as hex without hashtag.";
            };
            color1 = lib.mkOption {
              type = lib.types.str;
              description = "Second color as hex without hashtag.";
            };
            color2 = lib.mkOption {
              type = lib.types.str;
              description = "Third color as hex without hashtag.";
            };
            color3 = lib.mkOption {
              type = lib.types.str;
              description = "Fourth color as hex without hashtag.";
            };
            color4 = lib.mkOption {
              type = lib.types.str;
              description = "Fifth color as hex without hashtag.";
            };
            color5 = lib.mkOption {
              type = lib.types.str;
              description = "Sixth color as hex without hashtag.";
            };
          };
        };
      };
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
    cli = {
      cava.enable = lib.mkEnableOption "Cava";
      tokei.enable = lib.mkEnableOption "Tokei";
      nvim.enable = lib.mkEnableOption "Custom NVIM configuration";
    };
    clipboard.enable = lib.mkEnableOption "Clipboard";
    xdg.enable = lib.mkEnableOption "XDG";
  };
}
