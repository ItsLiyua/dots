{
  config,
  lib,
  ...
}: {
  options.liyua.utils.steamcfg.enable = lib.mkEnableOption "Custom steam config for faster downloads";
  config.home.file.".local/share/Steam/steam_dev.cfg" = lib.mkIf config.liyua.utils.steamcfg.enable {
    text = ''
      @nClientDownloadEnableHTTP2PlatformLinux 0
      @fDownloadRateImprovementToAddAnotherConnection 1.1
      @cMaxInitialDownloadSources 15
    '';
  };
}
