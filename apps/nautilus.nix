{
  config,
  lib,
  pkgs,
  ...
}: {
  options.liyua.apps.nautilus.enable = lib.mkEnableOption "Nautilus file explorer";
  config.home.packages = lib.mkIf config.liyua.apps.nautilus.enable [pkgs.nautilus];
}
