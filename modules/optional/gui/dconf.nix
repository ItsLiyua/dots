{
  config,
  lib,
  ...
}:
{
  options.liyua.dconf.enable = lib.mkEnableOption "Adds dconf";
  config.programs.dconf.enable = lib.mkIf config.liyua.dconf.enable true;
}
