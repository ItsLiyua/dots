{
  programs.nixvim = {
    plugins.lspconfig.enable = true;
    lsp.servers = {
      ts_ls = {
        enable = true;
        settings = {
          codeActionsOnSave = {
            "source.organizeImports.ts" = true;
            "source.removeUnused.ts" = true;
          };
        };
      };
    };
  };
}
