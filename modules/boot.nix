{ lib, ... }:
{
  options.liyua.bootloader = {
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
      default = 1;
      description = "For how long to show the bootloader";
    };
    memtest86.enable = lib.mkEnableOption "Support for Memtest86";
    maxEntries = lib.mkOption {
      type = lib.types.ints.positive;
      default = 50;
      description = "Maximum amount of stored fallback images";
    };
    plymouth.enable = lib.mkEnableOption "Plymouth theme";
  };
}
