{ config, lib, ... }:
lib.mkIf config.liyua.apps.zathura.enable {
  stylix.targets.zathura.enable = true;
  programs.zathura.enable = true;
}
