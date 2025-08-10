{ lib, ... }:
{
  liyua.cli.nvim.enable = true;
  home.stateVersion = lib.mkForce "25.05";
}
