{
  config,
  lib,
  ...
}: {
  options.liyua.desktop.hyprland.input.enable = lib.mkEnableOption "Custom input defaults";
  config = {
    liyua.desktop.hyprland.input.enable = config.liyua.desktop.hyprland.enable;
    wayland.windowManager.hyprland.settings.input = lib.mkIf config.liyua.desktop.hyprland.input.enable {
      kb_layout = "de";

      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0;

      touchpad.natural_scroll = false;
    };
  };
}
