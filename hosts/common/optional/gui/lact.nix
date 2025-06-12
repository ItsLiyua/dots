{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.liyua.gui.overclocking.gpu.lact.enable {
    environment.systemPackages = [ pkgs.lact ];
  };
}
