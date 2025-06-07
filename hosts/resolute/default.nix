{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/firewall.nix
  ];
  config = {
    networking.hostName = "resolute";
    console.keyMap = "us";
    liyua.keyd.enable = false;
    system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
  };
}
