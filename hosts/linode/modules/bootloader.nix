{ lib, ... }:
{
  boot.loader = {
    timeout = 10;
    grub = {
      forceInstall = true;
      extraConfig = ''
        serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1;
        terminal_input serial;
        terminal_output serial;
      '';
    };
  };
}
