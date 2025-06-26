{ config, lib, ... }:
{
  config = lib.mkIf config.liyua.desktop.wm.niri.enable {
    programs.niri.enable = true;
    stylix.targets.niri.enable = true;
  };
}
