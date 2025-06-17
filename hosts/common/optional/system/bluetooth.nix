{ config, lib, ... }:
{
  hardware.bluetooth = lib.mkIf config.liyua.bluetooth.enable {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
}
