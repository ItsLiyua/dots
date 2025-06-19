{ config, pkgs, ... }:
{
  sops.secrets."wireguard/linode".group = "systemd-network";

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
          publicKey = "JzFAa30tHG5Z+mVu1GZEeXGS18FQOfoNlDqBNNcb1iw=";
          allowedIPs = [ "10.15.0.2/32" ];
        }
        {
          publicKey = "PCFtL6M/vfrxFFVSXAi7ascCUFBrM9i8PhLLuTUDeyA=";
          allowedIPs = [ "10.15.0.3/32" ];
        }
      ];
    };
  };
}
