{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.ui.overclocking.gpu.lact.enable {
    environment.systemPackages = [ pkgs.lact ];
  };
}
