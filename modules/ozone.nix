{ config, lib, ... }:
{
  options.liyua.waylandNativeOzone.enable = lib.mkEnableOption "Wayland Native Ozone Apps";
  config.environment.sessionVariables.NIXOS_OZONE_WL = lib.mkIf config.liyua.waylandNativeOzone.enable 1;
}
