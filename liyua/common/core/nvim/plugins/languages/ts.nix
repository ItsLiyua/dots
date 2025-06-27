{ tsserver, pkgs, ... }:
{
  programs.nvf.settings.vim.languages.ts = {
    enable = true;
    format.type = "prettierd";
    lsp = {
      enable = true;
      package = tsserver.legacyPackages.${pkgs.system}.typescript-language-server;
      server = "ts_ls";
    };
  };
}
