{
  imports = [ ./disko.nix ];
  config = {
    liyua.network.wireless.enable = true;

    networking.hostName = "rocinante";
    time.timeZone = "Europe/Berlin";
    system.stateVersion = "25.11";
  };
}
