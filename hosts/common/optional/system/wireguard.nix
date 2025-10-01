{ config, lib, ... }:
{
  options.liyua.network.wireguard = {
    enable = lib.mkEnableOption "WireGuard integration";
    endpoint = lib.mkOption {
      type = lib.types.str;
      description = "The endpoint that is to be used as the server";
    };
    keepAliveInterval = lib.mkOption {
      type = lib.types.int;
      description = "The delay in seconds between two keepalive packets";
      default = 25;
    };
    self = lib.mkOption {
      type = lib.types.str;
      description = "The device configuration to be used for this device";
    };
    port = lib.mkOption {
      type = lib.types.port;
      default = 51820;
      description = "The port to listen to for incoming connections";
    };
    netMaskBits = lib.mkOption {
      type = lib.types.int;
      description = "The netmask that describes this network";
      default = 24;
      example = 8;
    };
    privateKeyFile = lib.mkOption {
      type = lib.types.str;
      description = "The path to the file containing this devices private key. This file has to be in the same location for all hosts but the contents may differ (obviously).";
    };
    devices = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            server = lib.mkEnableOption "Server features";
            assignedIP = lib.mkOption {
              type = lib.types.str;
              description = "The IP of this device";
            };
            publicKey = lib.mkOption {
              type = lib.types.str;
              description = "The public key of this device";
            };
          };
        }
      );
    };
  };

  config =
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
    };
}
