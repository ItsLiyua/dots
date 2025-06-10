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
      dconf.enable = false;
      gaming.enable = false;
      greeter.enable = false;
      wayland.enable = false;

      audio.enable = false;
      bootloader.enable = false;
      libinput.enable = false;
      logind.enable = false;
      swapescape.enable = false;
    };

    networking.hostName = "rpi5-1";
    system.stateVersion = "25.05";
  };
}
