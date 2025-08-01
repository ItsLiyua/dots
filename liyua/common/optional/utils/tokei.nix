{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.cli.tokei.enable { home.packages = [ pkgs.tokei ]; };
}
