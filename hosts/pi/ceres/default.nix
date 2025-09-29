{
  imports = [
    ./shared
    ../common
  ];

  config = {
    liyua.network.wireguard = {
      enable = true;
      self = "ceres"; # See modules/network/wireguard.nix
    };
    networking.hostName = "ceres";
  };
}
