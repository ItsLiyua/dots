{
  vim.languages.nix = {
    enable = true;
    extraDiagnostics.enable = false;
    format = {
      enable = true;
      type = "nixfmt";
    };
    lsp = {
      enable = true;
      server = "nil";
    };
    treesitter.enable = true;
  };
}
