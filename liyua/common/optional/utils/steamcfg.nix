{ config, lib, ... }:
{
  config.home.file.".local/share/Steam/steam_dev.cfg" = lib.mkIf config.liyua.steam.enable {
    text = ''
      @nClientDownloadEnableHTTP2PlatformLinux 0
      @fDownloadRateImprovementToAddAnotherConnection 1.1
      @cMaxInitialDownloadSources 15
    '';
  };
}
