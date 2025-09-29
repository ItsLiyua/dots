{ config, lib, ... }:
with config.liyua.network.wireguard;
lib.mkIf enable {
  networking = {
    firewall.allowedUDPPorts = [ port ];
    useNetworkd = true;
    nat = lib.mkIf devices.${self}.server {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };
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
        PrivateKeyFile = privateKeyFile;
        ListenPort = port;
        RouteTable = "main";
      };
      wireguardPeers =
        if devices.${self}.server then
          devices
          |> lib.mapAttrsToList (name: value: { inherit name value; })
          |> builtins.filter (e: e.name != self)
          |> builtins.map (e: e.value)
          |> builtins.map (e: {
            PublicKey = e.publicKey;
            AllowedIPs = [ e.assignedIP ];
          })
        else
          devices
          |> lib.mapAttrsToList (name: value: value)
          |> builtins.filter (e: e.server)
          |> builtins.map (e: {
            PublicKey = e.publicKey;
            AllowedIPs = [ (e.assignedIP + "/" + toString netMaskBits) ];
            PersistentKeepalive = keepAliveInterval;
            Endpoint = endpoint;
          });
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
