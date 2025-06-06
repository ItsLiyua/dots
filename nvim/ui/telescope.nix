{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.liyua.nvim.ui.telescope.enable = lib.mkEnableOption "Telescope";
  config = {
    liyua.nvim.ui.telescope.enable = lib.mkDefault config.liyua.nvim.ui.enable;
    programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.ui.telescope.enable {
      telescope = {
        enable = true;
        setupOpts.defaults = {
          path_display = [ "smart" ];
          mappings = {
            i = {
              "<C-k>" = lib.mkLuaInline ''require("telescope.actions").move_selection_previous'';
              "<C-j>" = lib.mkLuaInline ''require("telescope.actions").move_selection_next'';
              "<ESC>" = lib.mkLuaInline ''require("telescope.actions").close'';
            };
          };
        };
      };
      keymaps = [
        {
          key = "<leader><leader>";
          action = "<cmd>Telescope find_files<CR>";
          mode = [ "n" ];
          desc = "Smart open";
        }
      ];
    };
  };
}
