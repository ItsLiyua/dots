{ config, lib, ... }:
{
  config =
    with config.liyua.gaming;
    lib.mkIf enable {
      liyua.allow-unfree = [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ];

      programs.steam = lib.mkIf steam.enable {
        enable = true;
        localNetworkGameTransfers.openFirewall = steam.localGameTransfers;
        inherit (protontricks.enable) ;
      };
      hardware.xpadneo.enable = gamepadSupport;
    };
}
