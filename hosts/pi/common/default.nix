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
  liyua = {
    swapescape.enable = true;
    network.hostnameAdvertisement.enable = true;
  };

  console.keyMap = "us";
}
