{ lib, pkgs, ... }:
{
  programs.nvf.settings.vim.telescope = {
    enable = true;
    setupOpts.defaults = {
      color_devicons = true;
      path_display = [ "smart" ];
      mappings.i = {
        "<C-j>" = lib.mkLuaInline ''require("telescope.actions").move_selection_next'';
        "<C-k>" = lib.mkLuaInline ''require("telescope.actions").move_selection_previous'';
        "<ESC>" = lib.mkLuaInline ''require("telescope.actions").close'';
      };
    };
    extensions = [
      {
        name = "fzf";
        packages = [ pkgs.vimPlugins.telescope-fzf-native-nvim ];
        setup.fzf.fuzzy = true;
      }
      {
        name = "ui-select";
        packages = [ pkgs.vimPlugins.telescope-ui-select-nvim ];
        setup.ui-select = lib.mkLuaInline ''require("telescope.themes").get_dropdown({})'';
      }
    ];
    mappings.findFiles = "<leader><leader>";
  };

}
