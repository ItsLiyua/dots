{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      lazyLoad.settings = {
        cmd = "Telescope";
        keys = [
          {
            __unkeyed-1 = "<leader>ff";
            __unkeyed-2.__raw = ''function()require("telescope.builtin").find_files()end'';
            desc = "Find files";
          }
          {
            __unkeyed-1 = "<leader>fg";
            __unkeyed-2.__raw = ''function()require("telescope.builtin").live_grep()end'';
            desc = "Find files";
          }
          {
            __unkeyed-1 = "<leader><leader>";
            __unkeyed-2.__raw = ''function()require("telescope.builtin").find_files()end'';
            desc = "Find files";
          }
        ];
      };
      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
      };
      settings.defaults.mappings.i = {
        "<C-j>".__raw = ''require("telescope.actions").move_selection_next'';
        "<C-k>".__raw = ''require("telescope.actions").move_selection_previous'';
        "<esc>".__raw = ''require("telescope.actions").close'';
      };
    };
    dependencies.ripgrep.enable = true;
  };
}
