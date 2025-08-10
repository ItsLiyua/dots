{
  imports = [
    ./shared
    ../common
    ./glance.nix
    ./immich.nix
    ./jellyfin.nix
    ./nfs.nix
    ./radicale.nix
    ./vaultwarden.nix
  ];
  liyua.network.wireguard = {
    enable = true;
    self = "rpi5-1"; # See modules/network/wireguard.nix
  };
  networking.hostName = "rpi5-1";
}
