{ pkgs, nil_ls, ... }:
{
  programs.nvf.settings.vim.languages.nix = {
    enable = true;
    format.type = "nixfmt";
    lsp = {
      enable = true;
      package = nil_ls.packages.${pkgs.system}.nil;
      server = "nil";
    };
  };
}
