{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      enabledExtensions = [ "smart_open" ];
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
      settings.defaults.mappings.i = {
        "<C-j>".__raw = ''require("telescope.actions").move_selection_next'';
        "<C-k>".__raw = ''require("telescope.actions").move_selection_previous'';
        "<ESC>".__raw = ''require("telescope.actions").close'';
      };
    };
    extraPlugins = [ pkgs.vimPlugins.smart-open-nvim ];
  };
}
