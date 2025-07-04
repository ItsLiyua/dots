{ config, lib, ... }:
{
  programs.nvf.settings.vim.languages.typst = lib.mkIf config.liyua.cli.nvim.extraLanguages {
    enable = true;
    extensions.typst-preview-nvim.enable = true;
  };
}
