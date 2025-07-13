{ config, lib, ... }:
{
  programs.nvf.settings.vim = lib.mkIf config.liyua.cli.nvim.extraLanguages {
    languages.markdown = {
      enable = true;
      extensions.markview-nvim = {
        enable = true;
        setupOpts = {
          preview = {
            hybrid_modes = [ "n" ];
            linewise_hybrid_modes = true;
          };
        };
      };
      format.type = "prettierd";
    };
    utility.preview.markdownPreview.enable = true;
  };
}
