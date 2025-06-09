{
  config,
  lib,
  pkgs,
  ...
}:
{
  config.home.packages = lib.mkIf config.liyua.apps.prismlauncher.enable [ pkgs.prismlauncher ];
}
