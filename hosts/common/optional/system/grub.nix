{ config, lib, ... }:
{
  options.liyua.bootloader = {
    enable = lib.mkEnableOption "Default bootloader";
    efi.enable = lib.mkEnableOption "EFI support";
  };
  config.boot.loader =
    with config.liyua.bootloader;
    lib.mkIf enable {
      efi.canTouchEfiVariables = efi;
      inherit timeout;
      systemd-boot = lib.mkIf (type == "systemd-boot") {
        enable = true;
        inherit (memtest86.enable) ;
        configurationLimit = maxEntries;
      };
      grub = lib.mkIf (type == "grub") {
        enable = true;
        device = "nodev";
        efiSupport = efi;
        inherit (memtest86.enable) ;
        configurationLimit = maxEntries;
      };
    };
}
