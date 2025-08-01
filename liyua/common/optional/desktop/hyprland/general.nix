{ config, lib, ... }:
{
  wayland.windowManager.hyprland.settings.general = lib.mkIf config.liyua.desktop.wm.hyprland.enable {
    gaps_in = 5;
    gaps_out = 10;
    border_size = 2;
    resize_on_border = false;
    allow_tearing = false;
    layout = "dwindle";
    "col.active_border" =
      lib.mkForce "rgba(${config.lib.stylix.colors.base0C}ee) rgba(${config.lib.stylix.colors.base0D}ee) 45deg";
  };
}
