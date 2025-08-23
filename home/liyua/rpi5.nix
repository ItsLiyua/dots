{ lib, ... }:
{
  liyua.programs = {
    nvim.enable = true;
    btop = {
      enable = true;
      whitelistedDrives = [ "/" ];
    };
  };
  home.stateVersion = lib.mkForce "25.05";
}
