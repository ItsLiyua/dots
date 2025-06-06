{ config, lib, ... }:
{
  options.liyua.libinput.enable = lib.mkEnableOption "libinput";
  config.services.libinput.enable = lib.mkIf config.liyua.libinput.enable true;
}
