{ pkgs, ... }:
{
  # networking = {
  #   nat = {
  #     enable = true;
  #     externalInterface = "eth0";
  #     internalInterfaces = [ "wg0" ];
  #   };
  #   firewall.allowedUDPPorts = [ 51820 ];
  #
  #   wireguard.interfaces.wg0 = {
  #     ips = [ "10.100.0.1/8" ];
  #     listenPort = 51820;
  #     postSetup = ''
  #       ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
  #       ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 10.100.0.0/8 -o eth0 -j MASQUERADE
  #     '';
  #     postShutdown = ''
  #       ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
  #       ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 10.100.0.0/8 -o eth0 -j MASQUERADE
  #     '';
  #     privateKeyFile = "/home/liyua/privatekey";
  #     peers = [
  #       {
  #         publicKey = "8malqWLIkMY2LaM4nOTlfBJsWWX15VYZtnjqSah+ak8=";
  #         allowedIPs = [ "10.100.0.2/8" ];
  #       }
  #     ];
  #   };
  # };
}
