{ config, lib, ... }:
{
  options.liyua.nvim.editor.autocomplete.enable = lib.mkEnableOption "Autocompletion";
  config.programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.editor.autocomplete.enable {
    autocomplete.blink-cmp.enable = true;
  };
}
