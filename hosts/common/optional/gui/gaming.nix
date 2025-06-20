{ config, lib, ... }:
{
  config = with config.liyua.ui.gaming; {
    programs.steam =
      with steam;
      lib.mkIf enable {
        enable = true;
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
    hardware.xpadneo.enable = gamepadSupport;
  };
}
