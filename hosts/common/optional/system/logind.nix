{ config, lib, ... }:
{
  config.services.logind =
    with config.liyua.logind;
    lib.mkIf enable {
      powerKey = powerKeyMode;
      powerKeyLongPress = "poweroff";
    }
    // lib.mkIf sleepOnLidSwitch {
      lidSwitch = "suspend";
      lidSwitchExternalPower = "lock";
    };
}
