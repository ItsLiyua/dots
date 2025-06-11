{ config, lib, ... }:
{
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
