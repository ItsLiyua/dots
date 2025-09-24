{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
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
    nfs = {
      enable = true;
      drives = {
        music.enable = true;
        movies.enable = true;
        anime.enable = true;
      };
    };
  };

  networking = {
    hostName = "ganymede";
    hostId = "07487d09";
  };
  console.keyMap = "us";
}
