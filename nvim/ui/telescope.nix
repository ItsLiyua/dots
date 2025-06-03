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
      lazy.plugins = with pkgs.vimPlugins; {
        # "telescope-ui-select.nvim" = {
        #   package = telescope-ui-select-nvim;
        # };
        # "telescope-fzf-native.nvim" = {
        #   package = telescope-fzf-native-nvim;
        # };
        "smart-open.nvim" = {
          package = smart-open-nvim;
        };
      };
      keymaps = [
        {
          key = "<leader><leader>";
          action = "<cmd>Telescope smart_open<CR>";
          mode = [ "n" ];
          desc = "Smart open";
        }
      ];
    };
  };
}
