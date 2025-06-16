{
  imports = [
    ./modules/bootloader.nix
    ./modules/linode-utils.nix
    ./modules/remote-build-access.nix
    ./modules/wireguard.nix
    ./modules/net-interfaces.nix
    ./hardware-configuration.nix
  ];
  config = {
    liyua = {
      bootloader = {
        enable = false;
        mode = "grub";
      };
    };
    networking.hostName = "linode";
    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
