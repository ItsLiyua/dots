{ config, lib, ... }: {
  options.liyua.logind.enable = lib.mkEnableOption "LoginD";
  config.services.logind = lib.mkIf config.liyua.logind.enable {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "lock";
    powerKey = "suspend";
    powerKeyLongPress = "poweroff";
  };
}
