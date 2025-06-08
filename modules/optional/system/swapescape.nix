{ config, lib, ... }:
{
  options.liyua.swapescape.enable = lib.mkEnableOption "Esc-Caps swap";
  config.services.keyd = lib.mkIf config.liyua.swapescape.enable {
    enable = true;
    keyboards.default = {
      ids = [ "*" ];
      settings.main = {
        capslock = "esc";
        esc = "capslock";
      };
    };
  };
}
