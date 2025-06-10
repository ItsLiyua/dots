{ config, lib, ... }:
{
  options.liyua = {
    apps = {
      discord.enable = lib.mkEnableOption "Discord via Nixcord";
      firefox.enable = lib.mkEnableOption "Firefox";
      foot.enable = lib.mkEnableOption "Foot Terminal";
      nautilus.enable = lib.mkEnableOption "Nautilus File Manager";
      prismlauncher.enable = lib.mkEnableOption "PrismLauncher for Minecraft";
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
                type = ints.positive;
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
      };
      layout = lib.mkOption {
        type = lib.types.str;
        default = "us";
      };
      wm = {
        hyprland = {
          enable = lib.mkEnableOption "Hyprland Tiling WM";
          xwayland.enable = lib.mkEnableOption "Native XWayland support";
        };
        niri = {
          enable = lib.mkEnableOption "Niri Scrollable WM";
        };
      };
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
          type = lib.types.str;
          description = "The path to the wallpaper";
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
      theming = {
        enable = lib.mkEnableOption "Theming using stylix";
      };
    };
    cli = {
      cava.enable = lib.mkEnableOption "Cava";
      btop.gpudriver = lib.mkOption {
        type =
          with lib.types;
          nullOr (enum [
            "nvidia"
            "rocm"
          ]);
        default = "rocm";
      };
    };
    clipboard.enable = lib.mkEnableOption "Clipboard";
    steam.enable = lib.mkEnableOption "Steam configuration";
    xdg.enable = lib.mkEnableOption "XDG";
    nvim.lsp.enable = lib.mkEnableOption "LSP support for nvim";
  };
}
