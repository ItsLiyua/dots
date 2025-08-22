{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.programs.tokei.enable = lib.mkEnableOption "Tokei utility";
  config.home.packages = if config.liyua.programs.tokei.enable then [ pkgs.tokei ] else [ ];
}
