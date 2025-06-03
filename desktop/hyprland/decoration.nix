{
  config,
  lib,
  ...
}: {
  options.liyua.desktop.hyprland.decoration.enable = lib.mkEnableOption "Hyprland decorations";
  config = {
    liyua.desktop.hyprland.decoration.enable = config.liyua.desktop.hyprland.enable;
    wayland.windowManager.hyprland.settings.decoration = lib.mkIf config.liyua.desktop.hyprland.decoration.enable {
      rounding = 10;
      rounding_power = 2;
      active_opacity = 1.0;
      inactive_opacity = 1.0;
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };
      blur = {
        enabled = true;
        size = 3;
        passes = 1;
        vibrancy = 0.1696;
      };
    };
  };
}
