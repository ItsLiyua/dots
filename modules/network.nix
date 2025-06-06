{ config, lib, ... }:
{
  options.liyua.networkmanager.enable = lib.mkEnableOption "NetworkManager";
  config.networking = lib.mkIf config.liyua.networkmanager.enable {
    networkmanager.enable = true;
    firewall.enable = true;
  };
}
