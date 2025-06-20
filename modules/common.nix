{ lib, ... }:
{
  options.liyua = {
    ui = {
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
    graphics.enable = lib.mkEnableOption "Hardware acceleration and so on";
    bluetooth.enable = lib.mkEnableOption "Bluetooth management";
    upower.enable = lib.mkEnableOption "UPower support";
    bootloader = {
      enable = lib.mkEnableOption "Bootloader for standard x86-64 systems";
      mode = lib.mkOption {
        type = lib.types.enum [
          "grub"
          "systemd-boot"
        ];
        default = "grub";
        description = "Which bootloader to install";
      };
      efi = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Whether to enable efi support";
      };
      timeout = lib.mkOption {
        type = lib.types.ints.positive;
        default = 3;
        description = "For how long to show the bootloader";
      };
      memtest86.enable = lib.mkEnableOption "Support for Memtest86";
      maxEntries = lib.mkOption {
        type = lib.types.ints.positive;
        default = 50;
        description = "Maximum amount of stored fallback images";
      };
    };
    audio.enable = lib.mkEnableOption "PipeWire";
    libinput.enable = lib.mkEnableOption "LibInput";
    logind = {
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
    swapescape.enable = lib.mkEnableOption "Esc-Capslock swap";
    allow-unfree = lib.mkOption {
      default = [ ];
      example = [ "steam" ];
      description = "Specify allowed unfree packages";
      type = with lib.types; listOf (uniq str);
    };
    firmwareUpdater.enable = lib.mkEnableOption "Firmware updater tool";
    network = {
      wireless.enable = lib.mkEnableOption "Add wireless networking support";
      usePredictableInterfaceNames = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };
}
