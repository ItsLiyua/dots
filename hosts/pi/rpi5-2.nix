{ config, ... }:
{
  imports = [ ./modules ];

  networking = {
    hostName = "rpi5-2";
  };
}
