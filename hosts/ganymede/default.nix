{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/jellyfin.nix
    ./modules/nfs.nix
  ];
  liyua = {
    bootloader = {
      enable = true;
      mode = "systemd-boot";
      memtest86.enable = true;
    };
    swapescape.enable = true;
    network = {
      hostnameAdvertisement.enable = true;
      wireguard = {
        enable = true;
        self = "ganymede"; # See modules/network/wireguard.nix
      };
    };
    ssh.enableRootAccess = true;
  };

  networking = {
    hostName = "ganymede";
    hostId = "07487d09";
  };
  console.keyMap = "us";
}
