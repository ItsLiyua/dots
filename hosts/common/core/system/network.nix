{ config, lib, ... }:
{
  networking = {
    useNetworkd = true;
    inherit (config.liyua.network) usePredictableInterfaceNames;
    firewall.enable = true;
    wireless.iwd = lib.mkIf config.liyua.network.wireless.enable {
      enable = true;
      settings = {
        IPv6.Enabled = true;
        Settings.AutoConnect = true;
      };
    };
  };
  systemd.network.enable = true;
}
