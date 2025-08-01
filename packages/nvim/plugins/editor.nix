{
  vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      trouble.enable = true;
    };
    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    };
    autopairs.nvim-autopairs.enable = true;
    autocomplete.blink-cmp.enable = true;
    snippets.luasnip.enable = true;
    utility = {
      surround.enable = true;
      multicursors.enable = true;
      smart-splits.enable = true;
      undotree.enable = true;
      motion = {
        hop.enable = true;
        leap.enable = true;
      };
    };
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
  };
}
