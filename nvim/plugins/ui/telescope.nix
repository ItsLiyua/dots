{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      lazyLoad.settings = {
        cmd = "Telescope";
        keys = [
             "<leader>ff" "<leader>fg" "<leader><leader>"        ];
      };
      keymaps = {
        "<leader>ff" = {
          action = "find_files";
          options.desc = "Find files";
        };
        "<leader>fg" = {
          action = "live_grep";
          options.desc = "Find string in project";
        };
        "<leader><leader>" = {
          action = "smart_open";
          options.desc = "Smart open";
        };
      };
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      enabledExtensions = [ "smart_open" ];
      settings.defaults.mappings.i = {
        "<C-j>".__raw = ''require("telescope.actions").move_selection_next'';
        "<C-k>".__raw = ''require("telescope.actions").move_selection_previous'';
        "<ESC>".__raw = ''require("telescope.actions").close'';
      };
    };
    extraPlugins = [ pkgs.vimPlugins.smart-open-nvim ];
  };
}
