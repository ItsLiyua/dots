{ lib, ... }:
{
  imports = [
    ./modules/bootloader.nix
    ./modules/disko.nix
    ./modules/linode-utils.nix
    ./modules/remote-build-access.nix
    ./modules/net-interfaces.nix
    # ./hardware-configuration.nix
  ];
  config = {
    liyua.bootloader.enable = false;
    networking.hostName = "linode";
    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
