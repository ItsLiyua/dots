{ config, ... }:
{
  services.fwupd.enable = config.liyua.firmwareUpdater.enable;
}
