{ config, lib, ... }:
{
  programs.nvf.settings.vim.languages.markdown = lib.mkIf config.liyua.cli.nvim.extraLanguages {
    enable = true;
    extensions.markview-nvim.enable = true;
  };
}
