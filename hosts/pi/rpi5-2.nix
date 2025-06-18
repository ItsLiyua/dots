{ pkgs, ... }:
{
  imports = [ ./modules ];
  networking = {
    hostName = "rpi5-2";
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

      privateKeyFile = sops.secrets."wireguard/rpi5-2/private".path;

      peers = [
        {
          publicKey = builtins.readFile sops.secrets."wireguard/linode/public".path;
          allowedIPs = [ "10.15.0.2/32" ];
        }
      ];
    };
  };
}
