{ lib, ... }:
{
  options.liyua = {
    graphics.enable = lib.mkEnableOption "Hardware acceleration and so on";
    bluetooth.enable = lib.mkEnableOption "Bluetooth management";
    upower.enable = lib.mkEnableOption "UPower support";
    audio.enable = lib.mkEnableOption "PipeWire";
    libinput.enable = lib.mkEnableOption "LibInput";
    swapescape.enable = lib.mkEnableOption "Esc-Capslock swap";
    allow-unfree = lib.mkOption {
      default = [ ];
      example = [ "steam" ];
      description = "Specify allowed unfree packages";
      type = with lib.types; listOf (uniq str);
    };
    firmwareUpdater.enable = lib.mkEnableOption "Firmware updater tool";
  };
}
