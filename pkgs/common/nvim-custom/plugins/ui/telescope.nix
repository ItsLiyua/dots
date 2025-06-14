{ lib, pkgs, ... }:
{
  vim = {
    telescope = {
      enable = true;
      setupOpts.defaults = {
        color_devicons = true;
        path_display = [ "smart" ];
        mappings.i = {
          "<C-j>" = lib.mkLuaInline ''function()require("telescope.actions").move_selection_next()end'';
          "<C-k>" = lib.mkLuaInline ''function()require("telescope.actions").move_selection_previous()end'';
          "<ESC>" = lib.mkLuaInline ''function()require("telescope.actions").close()end'';
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
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader><leader>";
        mode = "n";
        silent = true;
        desc = "Find files";
      }
    ];
  };
}
