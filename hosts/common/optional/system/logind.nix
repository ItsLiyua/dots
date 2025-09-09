{ config, lib, ... }:
{
  options.liyua.logind = {
    enable = lib.mkEnableOption "LoginD";
    powerKeyMode = lib.mkOption {
      type = lib.types.enum [
        "none"
        "shutdown"
        "suspend"
      ];
      default = "shutdown";
      description = "How to handle the power key";
    };
    sleepOnLidSwitch = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to sleep when the lid is closed (only affects laptops)";
    };
  };
  config =
    let
      cfg = config.liyua.logind;
    in
    lib.mkIf cfg.enable {
      services.logind = {
        powerKey = cfg.powerKeyMode;
        powerKeyLongPress = "poweroff";
      }
      // lib.mkIf cfg.sleepOnLidSwitch {
        settings.Login.HandleLidSwitch = "suspend";
        settings.Login.HandleLidSwitchExternalPower = "lock";
      };
    };
}
