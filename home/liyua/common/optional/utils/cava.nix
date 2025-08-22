{ config, lib, ... }:
{
  options.liyua.programs.cava.enable = lib.mkEnableOption "Cava";
  config = lib.mkIf config.liyua.programs.cava.enable {
    stylix.targets.cava = {
      enable = true;
      rainbow.enable = true;
    };
    programs.cava = {
      enable = true;
      settings = {
        general.framrate = 60;
        input = {
          method = "pipewire";
          source = "auto";
        };
        smoothing.noice_reduction = 88;
      };
    };
  };
}
