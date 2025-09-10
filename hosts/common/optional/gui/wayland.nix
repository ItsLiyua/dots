{ config, lib, ... }:
{
  options.liyua.ui.wayland = {
    enable = lib.mkEnableOption "wayland customizations";
    defaultToNativeApps = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to launch electron apps with native wayland if possible or to use XWayland";
    };
  };
  config.environment.sessionVariables.NIXOS_OZONE_WL = lib.mkIf config.liyua.ui.wayland.enable 1;
}
