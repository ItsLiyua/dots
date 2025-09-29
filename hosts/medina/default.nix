{
  imports = [
    ./modules/disko.nix
    ./modules/bootloader.nix
    ./modules/network.nix
    ./modules/linode-utils.nix
    ./modules/traefik.nix
    ./modules/velocity.nix
    ./hardware-configuration.nix
  ];

  liyua = {
    bootloader.enable = false;
    network.wireguard = {
      enable = true;
      self = "medina"; # See modules/network/wireguard.nix
    };
  };

  networking.hostName = "medina";
  console.keyMap = "us";
}
