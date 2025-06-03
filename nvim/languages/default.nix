{ lib, ... }:
{
  imports = [
    ./nix.nix
  ];
  options.liyua.nvim.language.enable = lib.mkEnableOption "All languages";
  config.liyua.nvim.language.enable = lib.mkDefault true;
}
