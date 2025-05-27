{
  imports = [
    ./hardware-configuration.nix
    ./modules/disko.nix
    ./modules/bluetooth.nix
    ./modules/upower.nix
  ];

  networking.hostName = "liberty";
  console.keyMap = "de";

  system.stateVersion = "24.11"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES!
}
