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
      self = "linode"; # See modules/network/wireguard.nix
    };
  };

  system.stateVersion = "25.05";
  networking.hostName = "linode";
}
