{ lib, ...}: {
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          mode = "buffers";
          themable = true;
          numbers = "ordinal";
          indicator.style = "underline";
          diagnostics = "nvim_lsp";
          color_icons = true;
          show_buffer_icons = true;
          separator_style = "slant";
          always_show_bufferline = true;
        };
      };
      lazyLoad.settings.events = [ "BufNewFile" "BufOpen" ];
    };
    keymaps = lib.map (n: 
      {
        action = "<cmd>BufferLineGoToBuffer ${toString n}<CR>";
        key = "<leader>${toString (n - (10 * (n / 10)))}"; # The modulo PR has yet to be merged :/
        options.silent = true;
        mode = [ "n" ];
      }) [ 1 2 3 4 5 6 7 8 9 10 ];
  };
}
