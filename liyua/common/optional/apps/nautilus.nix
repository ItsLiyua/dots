{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.nautilus.enable {
  home.packages = [ pkgs.nautilus ];
}
