{
  nixos-raspberrypi,
  ...
}:
{
  imports = with nixos-raspberrypi.nixosModules; [
    raspberry-pi-5.base
    raspberry-pi-5.display-vc4
    raspberry-pi-5.bluetooth

    ./cachix.nix
    ./disko.nix
  ];
  config = {
    liyua = {
      swapescape.enable = true;
      network.hostnameAdvertisement.enable = true;
    };

    system.stateVersion = "25.05";
  };
}
