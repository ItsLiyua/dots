{
  imports = [
    ./modules/disko.nix
    ./modules/remote-build-access.nix
    ./modules/bootloader.nix
    ./modules/network.nix
    ./modules/linode-utils.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "linode";
}
