{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.steam.enable {
  home.packages = [ pkgs.steam ];
}
