{ config, lib, ... }:
{
  config.environment.sessionVariables.NIXOS_OZONE_WL = lib.mkIf config.liyua.wayland.enable 1;
}
