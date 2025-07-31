{
  config,
  lib,
  ...
}:
{
  programs.nvf.settings.vim.languages.ts = lib.mkIf config.liyua.cli.nvim.extraLanguages {
    enable = true;
    format.type = "prettierd";
    lsp = {
      enable = config.liyua.cli.nvim.lsp;
      server = "ts_ls";
    };
  };
}
