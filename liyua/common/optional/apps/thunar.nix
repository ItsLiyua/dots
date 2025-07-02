{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.thunar.enable {
  home.packages = with pkgs.xfce; [ thunar ];
}
