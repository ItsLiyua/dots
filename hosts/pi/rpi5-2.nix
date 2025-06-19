{ config, ... }:
{
  imports = [ ./modules ];

  networking = {
    hostName = "rpi5-2";
    firewall.allowedUDPPorts = [ 51820 ];
  };
}
