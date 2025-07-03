{
  config,
  lib,
  pkgs,
  ...
}:
lib.mkIf config.liyua.batmon.enable { environment.systemPackages = [ pkgs.batmon ]; }
