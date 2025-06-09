{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.home.packages = lib.mkIf config.liyua.apps.nautilus.enable [ pkgs.nautilus ];
}
