{
  config,
  lib,
  ...
}: {
  options.liyua.networkmanager.enable = lib.mkEnableOption "NetworkManager";
  config.networking.networkmanager.enable = lib.mkIf config.liyua.networkmanager.enable true;
}
