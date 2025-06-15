{
  vim.languages.nix = {
    enable = true;
    # format.type = "alejandra";
    format.type = "nixfmt";
    lsp = {
      enable = true;
      options.nil.nix.flake.autoEvalInputs = true;
    };
  };
}
