{ config, lib, ... }:
{
  config.services.libinput.enable = lib.mkIf config.liyua.libinput.enable true;
}
