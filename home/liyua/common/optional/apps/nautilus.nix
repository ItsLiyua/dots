{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.apps.nautilus.enable = lib.mkEnableOption "Nautilus File Manager";
  config = lib.mkIf config.liyua.apps.nautilus.enable {
    home.packages = [ pkgs.nautilus ];
  };
}
