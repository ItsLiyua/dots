{ config, lib, ... }:
{
  config.boot.loader =
    with config.liyua.bootloader;
    lib.mkIf enable {
      efi.canTouchEfiVariables = efi;
      inherit timeout;
      systemd-boot = lib.mkIf (mode == "systemd-boot") {
        enable = true;
        inherit memtest86;
        configurationLimit = maxEntries;
      };
      grub = lib.mkIf (mode == "grub") {
        enable = true;
        device = "nodev";
        efiSupport = efi;
        inherit memtest86;
        configurationLimit = maxEntries;
      };
    };
}
