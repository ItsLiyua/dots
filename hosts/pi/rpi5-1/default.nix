{
  imports = [
    ./shared
    ../common
    ./glance.nix
    ./radicale.nix
    ./vaultwarden.nix
  ];
  networking.hostName = "rpi5-1";
}
