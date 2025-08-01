{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.steam.enable {
  home = {
    packages = [ pkgs.steam ];
    file.".local/share/Steam/steam_dev.cfg" = {
      text = ''
        @nClientDownloadEnableHTTP2PlatformLinux 0
        @fDownloadRateImprovementToAddAnotherConnection 1.1
        @cMaxInitialDownloadSources 15
      '';
    };
  };
}
