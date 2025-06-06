{ config, lib, ... }:
{
  options.liyua.nvim.language.css.enable = lib.mkEnableOption "(S)CSS support";
  config = {
    liyua.nvim.language.css.enable = lib.mkDefault config.liyua.nvim.language.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.language.css.enable {
      languages.css = {
        enable = true;
        format.type = "prettierd";
        lsp.enable = config.liyua.nvim.lsp.enable;
      };
    };
  };
}
