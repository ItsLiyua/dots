{ lib, ... }:
{
  options.liyua.ui = {
    dconf.enable = lib.mkEnableOption "dconf (used for some UI apps)";
    gaming = {
      gamepadSupport = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to install xpadneo";
      };
    };
    greeter = {
      enable = lib.mkEnableOption "TUI Display Manager";
      launchCommand = lib.mkOption {
        type = lib.types.str;
        description = "Which command to run on login";
      };
      text = lib.mkOption {
        type = with lib.types; nullOr str;
        description = "The extra text on the login screen";
        default = null;
      };
    };
    wayland = {
      enable = lib.mkEnableOption "wayland customizations";
      defaultToNativeApps = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Whether to launch electron apps with native wayland if possible or to use XWayland";
      };
    };
    overclocking.gpu.lact.enable = lib.mkEnableOption "LACT";
  };
}
