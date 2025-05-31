{
  config,
  lib,
  pkgs,
  ...
}: {
  options.liyua.apps.prismlauncher.enable = lib.mkEnableOption "PrismLauncher";
  config.home.packages = lib.mkIf config.liyua.apps.prismlauncher.enable [pkgs.prismlauncher];
}
