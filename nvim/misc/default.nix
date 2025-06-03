{ lib, ... }:
{
  imports = [
    ./clipboard.nix
    ./options.nix
  ];
  options.liyua.nvim.misc.enable = lib.mkEnableOption "Misc stuff";
  config.liyua.nvim.misc.enable = lib.mkDefault true;
}
