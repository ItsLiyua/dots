{
  imports = [
    ./modules/disko.nix
    ./modules/bootloader.nix
    ./modules/network.nix
    ./modules/linode-utils.nix
    ./modules/traefik.nix
    ./modules/velocity.nix
    ./modules/wireguard.nix
    ./hardware-configuration.nix
  ];

  liyua.bootloader.enable = false;

  system.stateVersion = "25.05";
  networking.hostName = "linode";
}
