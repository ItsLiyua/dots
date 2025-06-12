{ config, lib, ... }:
{
  hardware.graphics = lib.mkIf config.liyua.graphics.enable {
    enable = true;
    enable32Bit = true;
  };
}
