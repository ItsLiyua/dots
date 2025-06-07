{ lib, ... }:
{
  imports = [
    ./gitsigns.nix
    ./indent-blankline.nix
    ./lualine.nix
    ./neotree.nix
    ./noice.nix
    ./smearcursor.nix
    ./telescope.nix
    ./whichkey.nix
    ./wordhighlight.nix
  ];
  options.liyua.nvim.ui.enable = lib.mkEnableOption "UI Improvements";
  config.liyua.nvim.ui.enable = lib.mkDefault true;
}
