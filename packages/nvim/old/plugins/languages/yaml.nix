{ config, ... }:
{
  programs.nvf.settings.vim.languages.yaml = {
    enable = true;
    lsp.enable = config.liyua.cli.nvim.lsp;
  };
}
