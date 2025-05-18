{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      lazyLoad.settings = {
        cmd = [ "Telescope" ];
        keys = [
          {
            __unkeyed-1 = "<leader><leader>";
            __unkeyed-2 = "<cmd>Telescope find_files<CR>";
            desc = "Find files or open buffers";
          }
          {
            __unkeyed-1 = "<leader>fg";
            __unkeyed-2= "<cmd>Telescope live_grep<CR>";
            desc = "Find text in files";
          }
        ];
      };
      extensions = {
        ui-select.enable = true;
        fzf-native.enable = true;
      };
      settings = {
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
  };
}
