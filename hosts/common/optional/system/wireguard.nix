{ config, lib, ... }:
with config.liyua.network.wireguard;
lib.mkIf enable {
  networking = {
    firewall.allowedUDPPorts = [ port ];
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
        PrivateKeyFile = devices.${self}.privateKeyFile;
        ListenPort = port;
        RouteTable = "main";
      };
      wireguardPeers =
        if devices.${self}.server then
          devices
          |> mapAttrs (name: value: { inherit name value; })
          |> filter (e: e.name != self)
          |> map (e: {
            PublicKey = e.value.publicKey;
            AllowedIPs = [ e.value.assignedIP ];
          })
        else
          devices
          |> mapAttrs (name: value: { inherit name value; })
          |> filter (e: e.server)
          |> map (e: {
            PublicKey = e.value.publicKey;
            AllowedIPs = [ (e.value.assignedIP + "/" + toString netMaskBits) ];
            PersistentKeepalive = keepAliveInterval;
            Endpoint = endpoint;
          });
      # wireguardPeers = [
      #   {
      #     # Resolute
      #     PublicKey = "PCFtL6M/vfrxFFVSXAi7ascCUFBrM9i8PhLLuTUDeyA=";
      #     AllowedIPs = [ "10.15.0.2" ];
      #   }
      #   {
      #     # RPi5-1
      #     PublicKey = "xF4JZGpbqSziuR82BRIBtYSyL0/MVqE58dgcK/mTcF8=";
      #     AllowedIPs = [ "10.15.0.3" ];
      #   }
      #   {
      #     # RPi5-2
      #     PublicKey = "UQ8STKuIHeKLHJE1Zv44Ms1LVshGITvCggtGXP6TBCw=";
      #     AllowedIPs = [ "10.15.0.4" ];
      #   }
      # ];
    };
    networks.wg0 = {
      matchConfig.Name = "wg0";
      address = [ (devices.${self}.assignedIP + "/" + toString netMaskBits) ];
      networkConfig = {
        IPMasquerade = "ipv4";
        IPv4Forwarding = true;
      };
    };
  };
}
