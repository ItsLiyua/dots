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
    };
    self = lib.mkOption {
      type = lib.types.str;
      description = "The device configuration to be used for this device";
    };
    port = lib.mkOption {
      type = lib.types.ints.port;
      description = "The port to listen to for incoming connections";
    };
    netMaskBits = lib.mkOption {
      type = lib.types.int;
      description = "The netmask that describes this network";
      default = 24;
      example = 8;
    };
    devices = lib.mkOption {
      type = lib.types.attrsOf {
        server = lib.mkEnableOption "Server features";
        assignedIP = lib.mkOption {
          type = lib.types.str;
          description = "The IP of this device";
        };
        privateKeyFile = lib.mkOption {
          type = lib.types.str;
          description = "The path to the file containing this devices private key.";
        };
        publicKey = lib.mkOption {
          type = lib.types.str;
          description = "The public key of this device";
        };
      };
    };
  };
}
