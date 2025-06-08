{ config, lib, ... }:
{
  options.liyua.wayland.enable = lib.mkEnableOption "Wayland configuration";
  config.environment.sessionVariables.NIXOS_OZONE_WL = lib.mkIf config.liyua.wayland.enable 1;
}
