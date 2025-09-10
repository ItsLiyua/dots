{ lib, ... }:
{
  options.liyua.ui = {
    gaming = {
      gamepadSupport = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to install xpadneo";
      };
    };
    overclocking.gpu.lact.enable = lib.mkEnableOption "LACT";
  };
}
