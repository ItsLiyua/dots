{ config, ... }:
{
  sops.secrets."wireguard/resolute".owner = "systemd-network";
  networking = {
    firewall.allowedUDPPorts = [ 51820 ];
    useNetworkd = true;
  };
  systemd.network = {
    enable = true;
    netdevs."50-wg0" = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
        MTUBytes = "1300";
      };
      wireguardConfig = {
        PrivateKeyFile = config.sops.secrets."wireguard/resolute".path;
        ListenPort = 51820;
        RouteTable = "main";
      };
      wireguardPeers = [
        {
          # Linode
          PublicKey = "cOa8ACs07xdE+C7H3O/+2tA7BKfIIHaojz80WZbazlM=";
          AllowedIPs = [ "10.15.0.1" ];
        }
      ];
    };
  };
  networks.wgo = {
    matchConfig.Name = "wg0";
    address = [ "10.15.0.2/24" ];
    networkConfig = {
      IPMasquerade = "ipv4";
      IPv4Forwarding = true;
    };
  };
}
