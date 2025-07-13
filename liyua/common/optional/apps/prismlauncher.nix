{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.prismlauncher.enable {
  home.packages = [ pkgs.prismlauncher ];
}
