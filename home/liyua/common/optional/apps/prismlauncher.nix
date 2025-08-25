{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.apps.prismlauncher.enable = lib.mkEnableOption "PrismLauncher for Minecraft";
  config = lib.mkIf config.liyua.apps.prismlauncher.enable {
    home.packages = [ pkgs.prismlauncher ];
  };
}
