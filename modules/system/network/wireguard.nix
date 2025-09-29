{ lib, ... }:
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
}
