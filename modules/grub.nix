{ config, lib, ... }:
{
  options.liyua.bootloader.enable = lib.mkEnableOption "Default bootloader";
  config.liyua.bootloader.enable = lib.mkDefault true;
  config.boot.loader = lib.mkIf config.liyua.bootloader.enable {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
  };
}
