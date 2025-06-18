{ config, ... }:
{
  networking = {
    firewall.allowedUDPPorts = [ 51820 ];
    wireguard.interfaces.wg0 = {
      ips = [ "10.15.0.2/24" ];
      listenPort = 51820;
      privateKeyFile = config.sops.secrets."wireguard/linode/private".path;
      peers = [
        {
          publicKey = builtins.readFile config.sops.secrets."wireguard/rpi5-2/public".path;
          allowedIPs = [ "10.15.0.0/24" ];
          endpoint = builtins.readFile config.sops.secrets."publicIP".path;
          persistentKeepalive = 25;
        }
      ];
    };
  };
}
