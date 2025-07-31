{
  config,
  pkgs,
  nil_ls,
  ...
}:
{
  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    format.type = "nixfmt";
    lsp = {
      enable = config.liyua.cli.nvim.lsp;
      package = nil_ls.packages.${pkgs.system}.nil;
      server = "nil";
      options.nix.flake = {
        autoArchive = true;
        autoEvalInputs = false;
      };
    };
    extraDiagnostics.enable = false;
  };
}
