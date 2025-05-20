{ config, lib, ...}: {
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings = {
        options = {
          mode = "buffers";
          themable = true;
          numbers = "ordinal";
          indicator.style = "underline";
          separator_style = "slant";
          diagnostics = "nvim_lsp";
          color_icons = true;
          show_buffer_icons = true;
          always_show_bufferline = true;
        };
        highlights = with config.lib.stylix.colors.withHashtag;
        let
          text = base05;
          sky = base0D;
          teal = base0C;
          red = base08;
          peach = base09;
          yellow = base0A;
          surface0 = base02;
          surface1 = base03;
          active_bg = base00;
          inactive_bg = base01;
          separator_fg = base02;
          styles = [ "bold" "italic" ];
        in {
          background.bg = inactive_bg;
          buffer_visible = {
            fg = surface1;
            bg = inactive_bg;
            inherit styles;
          };
          buffer_selected = {
            fg = text;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          duplicate_selected = {
            fg = text;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          duplicate_visible = {
            fg = surface1;
            bg = inactive_bg;
            inherit styles;
          };
          duplicate = {
            fg = surface1;
            bg = inactive_bg;
            inherit styles;
          };
          tab = {
            fg = surface1;
            bg = inactive_bg;
          };
          tab_selected = {
            fg = sky;
            bg = active_bg;
            sp = teal;
            bold = true;
          };
          tab_separator = {
            fg = separator_fg;
            bg = inactive_bg;
          };
          tab_separator_selected = {
            fg = separator_fg;
            bg = active_bg;
            sp = teal;
          };
          tab_close = {
            fg = red;
            bg = inactive_bg;
          };
          indicator_visible = {
            fg = peach;
            bg = inactive_bg;
            inherit styles;
          };
          indicator_selected = {
            fg = peach;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          separator = {
            fg = separator_fg;
            bg = inactive_bg;
          };
          separator_visible = {
            fg = separator_fg;
            bg = inactive_bg;
          };
          separator_selected = {
            fg = separator_fg;
            bg = active_bg;
            sp = teal;
          };
          close_button = {
            fg = surface1;
            bg = inactive_bg;
          };
          close_button_visible = {
            fg = surface1;
            bg = inactive_bg;
          };
          close_button_selected = {
            fg = red;
            bg = active_bg;
            sp = teal;
          };
          fill.bg = surface0;
          numbers = {
            fg = surface1;
            bg = inactive_bg;
          };
          numbers_visible = {
            fg = surface1;
            bg = inactive_bg;
          };
          numbers_selected = {
            fg = text;
            bg = active_bg;
            sp = teal;
          };
          error = {
            fg = red;
            bg = inactive_bg;
          };
          error_visible = {
            fg = red;
            bg = inactive_bg;
          };
          error_selected = {
            fg = red;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          error_diagnostic = {
            fg = red;
            bg = inactive_bg;
          };
          error_diagnostic_visible = {
            fg = red;
            bg = inactive_bg;
          };
          error_diagnostic_selected = {
            fg = red;
            bg = active_bg;
            sp = teal;
          };
          warning = {
            fg = yellow;
            bg = inactive_bg;
          };
          warning_visible = {
            fg = yellow;
            bg = inactive_bg;
          };
          warning_selected = {
            fg = yellow;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          warning_diagnostic = {
            fg = yellow;
            bg = inactive_bg;
          };
          warning_diagnostic_visible = {
            fg = yellow;
            bg = inactive_bg;
          };
          warning_diagnostic_selected = {
            fg = yellow;
            bg = active_bg;
            sp = teal;
          };
          info = {
            fg = sky;
            bg = inactive_bg;
          };
          info_visible = {
            fg = sky;
            bg = inactive_bg;
          };
          info_selected = {
            fg = sky;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          info_diagnostic = {
            fg = sky;
            bg = inactive_bg;
          };
          info_diagnostic_visible = {
            fg = sky;
            bg = inactive_bg;
          };
          info_diagnostic_selected = {
            fg = sky;
            bg = active_bg;
            sp = teal;
          };
          hint = {
            fg = teal;
            bg = inactive_bg;
          };
          hint_visible = {
            fg = teal;
            bg = inactive_bg;
          };
          hint_selected = {
            fg = teal;
            bg = active_bg;
            sp = teal;
            inherit styles;
          };
          hint_diagnostic = {
            fg = teal;
            bg = inactive_bg;
          };
          hint_diagnostic_visible = {
            fg = teal;
            bg = inactive_bg;
          };
          hint_diagnostic_selected = {
            fg = teal;
            bg = active_bg;
            sp = teal;
          };
          diagnostic = {
            fg = text;
            bg = inactive_bg;
          };
          diagnostic_visible = {
            fg = text;
            bg = inactive_bg;
          };
          diagnostic_selected = {
            fg = text;
            bg = active_bg;
            sp = teal;
          };
          modified = {
            fg = peach;
            bg = inactive_bg;
          };
          modified_visible = {
            fg = peach;
            bg = inactive_bg;
          };
          modified_selected = {
            fg = peach;
            bg = active_bg;
            sp = teal;
          };
        };
      };
      lazyLoad.settings.events = [ "BufNewFile" "BufOpen" ];
    };
    keymaps = lib.map (n: 
      {
        action = "<cmd>BufferLineGoToBuffer ${toString n}<CR>";
        key = "<leader>${toString (n - (10 * (n / 10)))}"; # The modulo PR has yet to be merged :/
        options = {
          silent = true;
          desc = "Open Buffer " + toString n;
        };
        mode = [ "n" ];
      }) [ 1 2 3 4 5 6 7 8 9 10 ];
  };
}
