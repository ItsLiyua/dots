{ config, ... }:
{
  sops.secrets."wireguard/resolute".group = "systemd-network";
  networking = {
    firewall.allowedUDPPorts = [ 51820 ];
    wireguard.interfaces.wg0 = {
      ips = [ "10.15.0.3/24" ];
      listenPort = 51820;
      privateKeyFile = config.sops.secrets."wireguard/resolute".path;
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
