{ config, ... }:
{
  imports = [ ./modules ];

  sops.secrets."wireguard/rpi5-2".group = "systemd-network";

  networking = {
    hostName = "rpi5-2";
    firewall.allowedUDPPorts = [ 51820 ];
    wireguard.interfaces.wg0 = {
      ips = [ "10.15.0.2/24" ];
      listenPort = 51820;
      privateKeyFile = config.sops.secrets."wireguard/rpi5-2".path;
      peers = [
        {
          publicKey = "cOa8ACs07xdE+C7H3O/+2tA7BKfIIHaojz80WZbazlM=";
          allowedIPs = [ "10.15.0.0/24" ];
          endpoint = "172.105.73.145:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
