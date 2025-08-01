{ config, lib, ... }:
{
  config = {
    wayland.windowManager.hyprland.settings.input = lib.mkIf config.liyua.desktop.wm.hyprland.enable {
      kb_layout = config.liyua.desktop.layout;

      follow_mouse = 1;
      accel_profile = "flat";
      sensitivity = 0;

      touchpad.natural_scroll = false;
    };
  };
}
