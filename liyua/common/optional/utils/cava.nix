{ config, lib, ... }:
{
  config = lib.mkIf config.liyua.cli.cava.enable {
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
