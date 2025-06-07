{ nixos-raspberrypi, ... }:
{
  imports = with nixos-raspberrypi.nixosModules.raspberry-pi-5; [
    base
    bluetooth
    ./modules/disko.nix
    ./modules/package-cache.nix
  ];
  config = {
    liyua = {
      audio.enable = false;
      bootloader.enable = false;
      extras.dconf.enable = false;
      fonts.enable = false;
      gaming.enable = false;
      greeter.enable = false;
      libinput.enable = false;
      logind.enable = false;
      waylandNativeOzone.enable = false;
      keyd.enable = false;
    };
    networking.hostName = "rpi5-1";
    system.stateVersion = "25.05";
  };
}
