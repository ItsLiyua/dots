{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = true;
    lazyLoad.settings.event = [ "BufNewFile" "BufReadPre" ];
    settings = {
      keymap =
        let
          a = l: l ++ [ "fallback" ];
        in {
        preset = "none";
        "<C-e>" = a [ "hide" ];
        "<Tab>" = a [ "select_and_accept" "snippet_forward" ];
        "<CR>" = a [ "accept" ];
        "<S-Tab>" = a [ "snippet_backward" ];
        "<Up>" = a [ "select_prev" ];
        "<Down>" = a [ "select_next" ];
        "<C-k>" = a [ "select_prev" ];
        "<C-j>" = a [ "select_next" ];
        "<C-b>" = a [ "scroll_documentation_up" ];
        "<C-f>" = a [ "scroll_documentation_down" ];
        "<C-s>" = a [ "show_signature" "hide_signature" ];
      };
      appearance = {
        use_nvim_cmp_as_default = true;
        nerd_font_variant = "mono";
      };
      sources = {
        default = [ "lsp" "snippets" "path" "buffer" ];
        transform_items.__raw = ''
          function(_, items)
            return vim.tbl_filter(function(item)
              return not (
                item.kind == require("blink.cmp.types").CompletionItemKind.Snippet
                and item.source.name == "LSP"
              )
            end, items)
          end
        '';
      };
      completion = {
        menu.draw = {
          columns = [ 
            {
              __unkeyed-1 = "kind_icon";
              __unkeyed-2 = "label";
              __unkeyed-3 = "label_description";
              __unkeyed-4 = "source_name";
              gap = 1;
            }
          ];
          components = {
            label_description.width.max = 50;
            source_name.text.__raw = ''function(ctx)return "[" .. ctx.source_name .. "]"end'';
          };
        };
        list.selection.preselect = false;
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 2000;
        };
      };
    };
  };
}
