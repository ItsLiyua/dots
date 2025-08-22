{ lib, ... }:
{
  liyua.programs.nvim.enable = true;
  home.stateVersion = lib.mkForce "25.05";
}
