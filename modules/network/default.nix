{ lib, ... }:
{
  imports = [ ./wireguard.nix ];
  options.liyua.network = {
    wireless.enable = lib.mkEnableOption "Add wireless networking support";
    usePredictableInterfaceNames = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
    hostnameAdvertisement.enable = lib.mkEnableOption "Access via hostname by advertising it to other devices on the network";
  };
}
