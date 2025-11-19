{
  imports = [ ./disko.nix ];
  config = {
    networking.hostName = "rocinante";
    time.timeZone = "Europe/Berlin";
    system.stateVersion = "25.11";
  };
}
