{ config, lib, pkgs, ... }: {
  wayland.windowManager.hyprland.settings.monitor = [ "eDP-1,2560x1600@60,0x0,1.6" ];
}
