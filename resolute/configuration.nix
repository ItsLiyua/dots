{
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
  ];
  networking.hostName = "resolute";
  console.keyMap = "us";
  networking.firewall = {
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565];
  };
  system.stateVersion = "25.05"; # DO NOT CHANGE UNDER ANY CIRCUMSTANCES
}
