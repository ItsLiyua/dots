{ pkgs, ... }: {
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.smart-open-nvim ];
    plugins.telescope = {
      enable = true;
      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
      settings = {
        enabledExtensions = [ "smart_open" ];
        mappings = {
          i = let
            action = m: ''require("telescope.actions").${m}'';
          in {
            "<C-k>".__raw = action "move_selection_previous";
            "<C-j>".__raw = action "move_selection_next";
            "<C-q>".__raw = action "close";
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
