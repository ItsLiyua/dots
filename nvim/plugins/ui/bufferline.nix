{ config, lib, ... }:
{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      lazyLoad.settings = {
        keys =
          [
            {
              __unkeyed-1 = "<Tab>";
              __unkeyed-2 = "<cmd>BufferLineCycleNext<CR>";
              desc = "Cycle to next buffer";
              silent = true;
            }
            {
              __unkeyed-1 = "<S-Tab>";
              __unkeyed-2 = "<cmd>BufferLineCyclePrev<CR>";
              desc = "Cycle to previous buffer";
              silent = true;
            }
          ]
          ++ (
            lib.range 1 10
            |> map (n: {
              __unkeyed-1 = "<leader>${n - n / 10 |> toString}";
              __unkeyed-2 = "<cmd>BufferLineGoToBuffer ${toString n}<CR>";
              desc = "Go to buffer ${toString n}";
              silent = true;
            })
          );
          event = ["BufReadPre""BufNewFile"];
      };
      settings = {
        options = {
          mode = "buffers";
          themable = true;
          numbers = "ordinal";
          diagnostics = "nvim_lsp";
          color_icons = true;
          show_buffer_icons = true;
          always_show_bufferline = true;
        };
      };
    };
  };
}
