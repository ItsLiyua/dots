{
  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    format.type = "nixfmt";
    lsp = {
      enable = true;
      options.nil.nix.flake = {
        autoEvalInputs = true;
        autoArchive = true;
      };
    };
  };
}
