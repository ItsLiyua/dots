{
  config,
  lib,
  tsserver,
  pkgs,
  ...
}:
{
  programs.nvf.settings.vim.languages.ts = lib.mkIf config.liyua.cli.nvim.extraLanguages {
    enable = true;
    format.type = "prettierd";
    lsp = {
      enable = config.liyua.cli.nvim.lsp;
      package = tsserver.legacyPackages.${pkgs.system}.typescript-language-server;
      server = "ts_ls";
    };
  };
}
