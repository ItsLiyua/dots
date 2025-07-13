{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.apps.prismlauncher.enable {
  stylix.targets.qt.enable = true;
  home.packages = [ pkgs.prismlauncher ];
}
