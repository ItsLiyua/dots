{ lib, ... }:
{
  imports = [
    ./css.nix
    ./nix.nix
    ./typescript.nix
  ];
  options.liyua.nvim.language.enable = lib.mkEnableOption "All languages";
  config.liyua.nvim.language.enable = lib.mkDefault true;
}
