{ config, lib, ... }:
{
  options.liyua.nvim.editor.autoclose.enable = lib.mkEnableOption "Autoclose brackets";
  config = {
    liyua.nvim.editor.autoclose.enable = lib.mkDefault config.liyua.nvim.editor.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.editor.autoclose.enable {
      treesitter.autotagHtml = true;
      autopairs.nvim-autopairs.enable = true;
    };
  };
}
