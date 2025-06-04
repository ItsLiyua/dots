{ config, lib, ... }:
{
  options.liyua.nvim.ui.indentMarker.enable = lib.mkEnableOption "Indent Markers";
  config = {
    liyua.nvim.ui.indentMarker.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.indentMarker.enable {
      visuals.indent-blankline.enable = true;
    };
  };
}
