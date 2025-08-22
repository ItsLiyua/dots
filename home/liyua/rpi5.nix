{ lib, ... }:
{
  liyua.programs = {
    nvim.enable = true;
    btop = {
      enable = true;
      whitelistedDrives = [
        "/"
        "/boot"
        "/home"
        "/mnt/nfs"
      ];
    };
  };
  home.stateVersion = lib.mkForce "25.05";
}
