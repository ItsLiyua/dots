{
  programs.nixvim = {
    plugins.nvim-autopairs = {
      enable = true;
      lazyLoad.settings = {
        event = [ "BufNewFile" "BufReadPre" ];
        before.__raw = ''function()require("lz.n").trigger_load("nvim-treesitter")end'';
      };
      settings.disable_filetype = [
        "TelescopePrompt"
        "neo-tree"
        "neo-tree-popup"
      ];
    };
  };
}
