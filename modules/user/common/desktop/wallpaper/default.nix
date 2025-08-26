{ lib, ... }:
{
  options.liyua.desktop.wallpaper = {
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
      example = {
        eDP-1 = "/path/to/wallpaper-1.png";
        HDMI-A-1 = "/path/to/another/wallpaper.jpg";
      };
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
}
