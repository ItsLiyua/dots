{ config, lib, ... }:
{
  options.liyua.bootloader = {
    enable = lib.mkEnableOption "Default bootloader";
    efi.enable = lib.mkEnableOption "EFI support";
  };
  config.boot.loader = lib.mkIf config.liyua.bootloader.enable {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = config.liyua.bootloader.efi.enable;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = config.liyua.bootloader.efi.enable;
    };
  };
}
