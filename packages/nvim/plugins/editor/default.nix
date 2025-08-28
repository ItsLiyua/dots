{
  imports = [
    ./blink.nix
    ./dap.nix
    ./lsp.nix
    ./treesitter.nix
  ];
  config.vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;
    };
    autopairs.nvim-autopairs.enable = true;
    snippets.luasnip.enable = true;
    mini.surround.enable = true;
    utility = {
      multicursors.enable = true;
      undotree.enable = true;
    };
    terminal.toggleterm = {
      enable = true;
      lazygit.enable = true;
    };
  };
}
