{
  config,
  lib,
  ...
}: {
  options.liyua.desktop.hyprland.xwayland.enable = lib.mkEnableOption "XWayland on Hyprland";
  config = {
    liyua.desktop.hyprland.xwayland.enable = lib.mkDefault config.liyua.desktop.hyprland.enable;
    wayland.windowManager.hyprland.settings.xwayland = {
      enabled = true;
      force_zero_scaling = false;
    };
  };
}
