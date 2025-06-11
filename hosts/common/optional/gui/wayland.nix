{ config, lib, ... }:
{
  config.environment.sessionVariables.NIXOS_OZONE_WL = lib.mkIf config.liyua.ui.wayland.enable 1;
}
