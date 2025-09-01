{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.apps.steam.enable = lib.mkEnableOption "Steam Game Store";
  config = lib.mkIf config.liyua.apps.steam.enable {
    home = {
      packages = with pkgs; [
        steam
        gamescope
      ];
      file.".local/share/Steam/steam_dev.cfg" = {
        text = ''
          @nClientDownloadEnableHTTP2PlatformLinux 0
          @fDownloadRateImprovementToAddAnotherConnection 1.1
          @cMaxInitialDownloadSources 15
        '';
      };
    };
  };
}
