{ lib, pkgs, ... }:{
  imports = [./hardware-configuration.nix];
  config = {
    liyua = {
      audio.enable = false;
      extras.dconf.enable = false;
      fonts.enable = false;
      gaming.enable = false;
      greeter.enable = false;
      libinput.enable = false;
      logind.enable = false;
      waylandNativeOzone.enable = false;
    };
    boot.loader.timeout = 10;
    boot.loader.grub = {
      forceInstall = true;
      extraConfig = ''
        serial --speed=19200 --unit=0 --word=8 --parity=no --stop=1;
        terminal_input serial;
        terminal_output serial;
      '';
    };
    networking.hostName = "linode";
    environment.systemPackages = with pkgs; [
      inetutils
      mtr
      sysstat
    ];
    networking = {
      usePredictableInterfaceNames = false;
      useDHCP = false;
      interfaces.eth0.useDHCP = true;
    };
    boot.loader = {
      efi.canTouchEfiVariables = lib.mkForce false;
      grub.efiSupport = lib.mkForce false;
    };
    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
