{
  imports = [
    ./shared
    ../common
    ./glance.nix
    ./grafana.nix
    ./prometheus.nix
    ./radicale.nix
    ./vaultwarden.nix
  ];
  liyua = {
    network.wireguard = {
      enable = true;
      self = "eros"; # See modules/network/wireguard.nix
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
  networking.hostName = "eros";
}
