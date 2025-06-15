{
  imports = [./nix.nix];
  vim = {
    languages = {
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;
    };
    lsp = {
      enable = true;
      formatOnSave = true;
      inlayHints.enable = true;
      lspSignature.enable = true;
    };
    spellcheck = {
      enable = true;
      languages = [
        "en"
        "de"
      ];
      programmingWordlist.enable = true;
    };
  };
}
