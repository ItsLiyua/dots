{ lib, ... }:
{
  boot.loader = {
    efi.canTouchEfiVariables = lib.mkForce false;
    timeout = 10;
    grub = {
      forceInstall = true;
      efiSupport = lib.mkForce false;
      extraConfig = ''
        serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1;
        terminal_input serial;
        terminal_output serial;
      '';
    };
  };
}
