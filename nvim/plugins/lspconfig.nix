{
  programs.nixvim = {
    plugins.lspconfig.enable = true;
    lsp.servers = {
      ts_ls.enable = true;
    };
  };
}
