{ config, lib, ... }:
{
  services.avahi = lib.mkIf config.liyua.network.hostnameAdvertisement.enable {
    nssmdns4 = true;
    enable = true;
    ipv4 = true;
    ipv6 = true;
    publish = {
      enable = true;
      addresses = true;
      workstation = true;
    };
  };
}
