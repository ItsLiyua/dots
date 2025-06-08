{ config, lib, ... }:
{
  options.liyua.keyd.enable = lib.mkEnableOption "Esc-Caps swap";
  config.services.keyd = {
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
