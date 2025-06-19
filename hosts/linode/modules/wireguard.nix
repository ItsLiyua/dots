{ config, ... }:
{
  sops.secrets."wireguard/linode".group = "systemd-network";

  networking = {
    firewall.allowedUDPPorts = [ 51820 ];
  };
  systemd.network = {
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
          PublicKey = "JzFAa30tHG5Z+mVu1GZEeXGS18FQOfoNlDqBNNcb1iw=";
          AllowedIPs = [ "10.15.0.2" ]; # /32
        }
        {
          PublicKey = "PCFtL6M/vfrxFFVSXAi7ascCUFBrM9i8PhLLuTUDeyA=";
          AllowedIPs = [ "10.15.0.3" ]; # /32
        }
      ];
    };

    networks.wg0 = {
      matchConfig.Name = "wg0";
      address = [ "10.15.0.1/24" ];
      networkConfig = {
        IPMasquerade = "ipv4";
        IPv4Forwarding = true;
        IPv6Forwarding = true;
      };
    };
  };
}
