{ pkgs, ... }:
{
  programs.nvf.settings.vim.lazy.plugins."smear-cursor.nvim" = {
    package = pkgs.vimPlugins.smear-cursor-nvim;
    setupModule = "smear_cursor";
    lazy = true;
    cmd = "SmearCursorToggle";
    event = [
      "CursorMoved"
      "CursorMovedC"
      "CursorMovedI"
    ];
  };
}
