{ config, lib, ... }:
{
  config = with config.liyua.ui.gaming; {
    programs.steam =
      with steam;
      lib.mkIf enable {
        enable = true;
        localNetworkGameTransfers.openFirewall = localGameTransfers;
        inherit protontricks;
      };
    liyua.allow-unfree =
      if steam.enable then
        [
          "steam"
          "steam-original"
          "steam-unwrapped"
          "steam-run"
        ]
      else
        [ ];

  };
}
