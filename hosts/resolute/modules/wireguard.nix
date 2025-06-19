{ config, ... }:
{
  sops.secrets."wireguard/resolute".group = "systemd-network";
  boot.kernelModules = [ "wireguard" ];
  systemd.network = {
    netdevs."10-wg0" = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
        MTUBytes = "1300";
      };
      wireguardConfig = {
        PrivateKeyFile = config.sops.secrets."wireguard/resolute".path;
        ListenPort = 51820;
      };
      wireguardPeers = [
        {
          PublicKey = "cOa8ACs07xdE+C7H3O/+2tA7BKfIIHaojz80WZbazlM=";
          AllowedIPs = [ "10.15.0.1/24" ];
          Endpoint = "172.105.73.145:51820";
          PersistentKeepalive = 25;
        }
      ];
    };
    networks.wg0 = {
      matchConfig.Name = "wg0";
      address = [
        "10.15.0.3/24"
        "fc00::3/120"
        "fe80::3/64"
      ];
      DHCP = "no";
      dns = [ "fc00::53" ];
      ntp = [ "fc00::123" ];
      gateway = [
        "fc00::1"
        "10.15.0.1"
      ];
      networkConfig.IPv6AcceptRA = false;
    };
  };
}
