{
  imports = [ ./modules ];
  networking.hostName = "rpi5-2";

  users.users.liyua.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF51hDj3q1xBFOP10Nvdp9vfAOl/q0o5GalBAwoRxYxg liyua@linode"
  ];
}
