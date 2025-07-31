{
  vim.languages.nix = {
    enable = true;
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
