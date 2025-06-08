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
      bootloader = {
        enable = true;
        efi.enable = false;
      };
      swapescape.enable = true;
    };
    networking.hostName = "rpi5-1";
    system.stateVersion = "25.05";
  };
}
