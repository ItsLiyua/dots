{ config, lib, ... }:
{
  imports = [
    ./markdown.nix
    ./nix.nix
    ./ts.nix
    ./yaml.nix
  ];
  programs.nvf.settings.vim = {
    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
    };
    lsp = {
      enable = lib.mkForce config.liyua.cli.nvim.lsp;
      formatOnSave = true;
      inlayHints.enable = true;
    };
    spellcheck = {
      enable = true;
      languages = [
        "en"
        "de"
      ];
      programmingWordlist.enable = true;
    };
    treesitter = {
      autotagHtml = true;
      fold = true;
      highlight.enable = true;
      incrementalSelection.enable = true;
      indent.enable = true;
    };
  };
}
