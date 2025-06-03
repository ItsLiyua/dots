{ lib, ... }:
{
  imports = [
    ./neotree.nix
    ./wordhighlight.nix
  ];
  options.liyua.nvim.ui.enable = lib.mkEnableOption "UI Improvements";
  config.liyua.nvim.ui.enable = lib.mkDefault true;
}
