{ config, ... }:
{
  sops.secrets."wireguard/linode".owner = "systemd-network";
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
        PrivateKeyFile = config.sops.secrets."wireguard/linode".path;
        ListenPort = 51820;
        RouteTable = "main";
      };
      wireguardPeers = [
        {
          # Resolute
          PublicKey = "PCFtL6M/vfrxFFVSXAi7ascCUFBrM9i8PhLLuTUDeyA=";
          AllowedIPs = [ "10.15.0.2" ];
          PersistentKeepalive = 25;
        }
      ];
    };
    networks.wg0 = {
      matchConfig.Name = "wg0";
      address = [ "10.15.0.1/24" ];
      networkConfig = {
        IPMasquerade = "ipv4";
        IPv4Forwarding = true;
      };
    };
  };
}
