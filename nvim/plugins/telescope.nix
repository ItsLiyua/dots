{ pkgs, ... }: {
  home.packages = [ pkgs.ripgrep ];
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.smart-open-nvim ];
    plugins.telescope = {
      enable = true;
      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
      enabledExtensions = [ "smart_open" ];
      settings = {
        defaults = {
          mappings = {
            i = {
              "<C-K>".__raw = ''require("telescope.actions").move_selection_previous'';
              "<C-J>".__raw = ''require("telescope.actions").move_selection_next'';
              "<C-q>".__raw = ''require("telescope.actions").close'';
              "<Esc>".__raw = ''require("telescope.actions").close'';
            };
          };
        };
      };
    };
    keymaps = [
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
        options.desc = "Find files";
      }
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
        options.desc = "Find text in project";
      }
      {
        action = "<cmd>Telescope smart_open<CR>";
        key = "<leader><leader>";
        options.desc = "Smart open";
      }
    ];
  };
}
