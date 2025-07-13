{ config, lib, ... }:
{
  hardware.bluetooth = {
    enable = lib.mkForce config.liyua.bluetooth.enable;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
}
