{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.nvim.ui.smearcursor.enable = lib.mkEnableOption "smearcursor";
  config = {
    liyua.nvim.ui.smearcursor.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim.lazy.plugins = lib.mkIf config.liyua.nvim.ui.smearcursor.enable {
      "smear-cursor.nvim" = {
        package = pkgs.vimPlugins.smear-cursor-nvim;
        setupModule = "smear_cursor";
        setupOpts = { };
        lazy = true;
        cmd = [ "SmearCursorToggle" ];
        event = [
          "CursorMoved"
          "CursorMovedC"
          "CursorMovedI"
        ];
      };
    };
  };
}
