{
  config,
  lib,
  ...
}:
{
  programs.nvf.settings.vim.languages.kotlin = lib.mkIf config.liyua.cli.nvim.extraLanguages {
    enable = true;
    extraDiagnostics.enable = true;
  };
}
