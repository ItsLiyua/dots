{
  imports = [
    ./shared
    ../common
    ./glance.nix
    ./radicale.nix
    ./vaultwarden.nix
  ];
  liyua = {
    network.wireguard = {
      enable = true;
      self = "rpi5-1"; # See modules/network/wireguard.nix
    };
    nfs = {
      enable = true;
      drives = {
        anime.enable = true;
        movies.enable = true;
        music.enable = true;
      };
    };
  };
  networking.hostName = "rpi5-1";
}
