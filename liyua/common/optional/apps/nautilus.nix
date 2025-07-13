{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.nautilus.enable {
  stylix.targets.gnome.enable = true;
  home.packages = [ pkgs.nautilus ];
}
