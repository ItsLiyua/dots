{ config, lib, ... }:
{
  options.liyua.apps.kitty.enable = lib.mkEnableOption "Kitty Terminal";
  config = lib.mkIf config.liyua.apps.kitty.enable {
    stylix.targets.kitty.enable = true;
    programs.kitty = {
      enable = true;
      settings = {
        window_padding_width = 4;
        window_padding_height = 4;
      };
    };
  };
}
