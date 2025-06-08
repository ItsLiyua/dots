{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/bluetooth.nix
    ./modules/upower.nix
  ];

  config = {
    networking.hostName = "liberty";
    console.keyMap = "de";

    liyua.keyd.enable = true;

    system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
  };
}
