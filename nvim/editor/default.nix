{ lib, ... }:
{
  imports = [
    ./autoclose.nix
    ./autocomplete.nix
    ./format.nix
  ];
  options.liyua.nvim.editor.enable = lib.mkEnableOption "Editor related plugins";
  config.liyua.nvim.editor.enable = lib.mkDefault true;
}
