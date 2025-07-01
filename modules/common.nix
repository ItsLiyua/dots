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
    powerManagement.enable = lib.mkEnableOption "Power Management via TLP";
    btop = {
      enable = lib.mkEnableOption "Btop";
      gpuType = lib.mkOption {
        type =
          with lib.types;
          nullOr (enum [
            "intel"
            "amd"
            "nvidia"
          ]);
        description = "The type of GPU driver you want to use for GPU stats. Null means no specialized package will be used";
        example = "amd";
        default = null;
      };
    };
  };
}
