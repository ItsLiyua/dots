{
  imports =    [
      ./disko.nix
      ./hardware-configuration.nix
    ];
  networking.hostName = "resolute";
  console.keyMap = "us";
  system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
}

