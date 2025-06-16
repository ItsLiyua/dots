{
  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    format.type = "nixfmt";
    lsp = {
      enable = true;
      options.nix.flake.autoEvalInputs = true;
    };
  };
}
