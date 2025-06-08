{ config, lib, ... }:
{
  options.liyua.gaming.enable = lib.mkEnableOption "Steam and Gaming drivers";
  config = lib.mkIf config.liyua.gaming.enable {
    liyua.allow-unfree = [
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

    programs.steam = {
      enable = true;
      localNetworkGameTransfers.openFirewall = true;
      protontricks.enable = true;
    };
    hardware.xpadneo.enable = true;
  };
}
