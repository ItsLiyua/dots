{
  imports = [
    ./shared
    ../common
    ./minecraft.nix
  ];

  config = {
    liyua.network.wireguard = {
      enable = true;
      self = "rpi5-2"; # See modules/network/wireguard.nix
    };
    networking.hostName = "rpi5-2";
  };
}
