{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.thunar.enable {
  stylix.targets.xfce.enable = true;
  home.packages = with pkgs.xfce; [ thunar ];
}
