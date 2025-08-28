{ pkgs, ... }:
{
  vim.treesitter = {
    enable = true;
    autotagHtml = true;
    fold = true;
    grammars = [ pkgs.vimPlugins.nvim-treesitter-parsers.just ];
    context = {
      enable = true;
    };
  };
}
