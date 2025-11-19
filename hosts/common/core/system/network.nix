{ config, lib, ... }:
{
  options.liyua.network.wireless.enable = lib.mkEnableOption "Wireless network access using iwd";
  config = {
    networking = {
      useNetworkd = true;
      enableIPv6 = true;
      firewall.enable = true;
      wireless.iwd = lib.mkIf config.liyua.network.wireless.enable {
        enable = true;
        settings = {
          IPv6.Enabled = true;
          Settings.AutoConnect = true;
        };
      };
      nameservers = [
        "1.1.1.1#one.one.one.one"
        "1.0.0.1#one.one.one.one"
      ];
    };
    # systemd.network.enable = true;
  };
}
