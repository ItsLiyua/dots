{ config, pkgs, ... }:
{
  sops.secrets."wireguard/linode" = { };

  networking = {
    # WireGuard server
    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };
    firewall.allowedUDPPorts = [ 51820 ];
    wireguard.interfaces.wg0 = {
      ips = [ "10.15.0.1/24" ];
      listenPort = 51820;

      postSetup = ''
        ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';
      postShutdown = ''
        ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/24 -o eth0 -j MASQUERADE
      '';

      privateKeyFile = config.sops.secrets."wireguard/linode".path;

      peers = [
        {
          publicKey = "cOa8ACs07xdE+C7H3O/+2tA7BKfIIHaojz80WZbazlM=";
          allowedIPs = [ "10.15.0.2/32" ];
        }
      ];
    };
  };
}
