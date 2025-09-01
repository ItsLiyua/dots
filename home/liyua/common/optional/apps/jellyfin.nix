{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.apps.jellyfin-media-player.enable = lib.mkEnableOption "Jellyfin Media Player";
  config = lib.mkIf config.liyua.apps.jellyfin-media-player.enable {
    nixpkgs.config.permittedInsecurePackages = [ "qtwebengine-5.15.19" ];
    home.packages = [ pkgs.jellyfin-media-player ];
  };
}
