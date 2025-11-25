{ config, ... }:
{
  config = with config.liyua.ui.gaming; {
    hardware.xpadneo.enable = gamepadSupport;
  };
}
