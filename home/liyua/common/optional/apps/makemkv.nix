{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.apps.makemkv.enable = lib.mkEnableOption "MakeMKV and other utilities";
  config = lib.mkIf config.liyua.apps.makemkv.enable {
    home.packages = with pkgs; [
      makemkv
      handbrake
      vlc
      mkvtoolnix
    ];
  };
}
