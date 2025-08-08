{
  vim.languages.ts = {
    enable = true;
    format = {
      enable = true;
      type = "prettierd";
    };
    lsp = {
      enable = true;
      server = "ts_ls";
    };
    treesitter.enable = true;
  };
}
