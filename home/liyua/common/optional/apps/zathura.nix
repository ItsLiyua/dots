{ config, lib, ... }:
{
  options.liyua.apps.zathura.enable = lib.mkEnableOption "Zathura PDF viewer";
  config = lib.mkIf config.liyua.apps.zathura.enable {
    stylix.targets.zathura.enable = true;
    programs.zathura.enable = true;
  };
}
