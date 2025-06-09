{ config, lib, ... }:
{
  wayland.windowManager.hyprland.settings.xwayland = {
    enabled = config.liyua.desktop.wm.hyprland.xwayland.enable;
    force_zero_scaling = false;
  };
}
