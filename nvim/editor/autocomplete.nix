{ config, lib, ... }:
{
  options.liyua.nvim.editor.autocomplete.enable = lib.mkEnableOption "Autocompletion";
  config.programs.nvf.settings.vim = lib.mkIf config.liyua.nvim.editor.autocomplete.enable {
    autocomplete.blink-cmp =
      let
        keymap = {
          preset = "none";
          "<C-e>" = [
            "hide"
            "fallback"
          ];
          "<Tab>" = [
            "select_and_accept"
            "snippet_forward"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
          "<C-K>" = [
            "select_prev"
            "fallback"
          ];
          "<C-J>" = [
            "select_next"
            "fallback"
          ];
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-s>" = [
            "show_signature"
            "hide_signature"
            "fallback"
          ];
        };
      in
      {
        enable = true;
        friendly-snippets.enable = true;
        mappings = {
          complete = null;
          confirm = null;
          next = null;
          previous = null;
          close = null;
          scrollDocsUp = null;
          scrollDocsDown = null;
        };
        setupOpts = {
          inherit keymap;
          cmdline.enabled = false;
          appearance = {
            use_nvim_cmp_as_default = true;
            nerd_font_variant = "normal";
          };
          sources = {
            default = lib.mkForce [
              "lsp"
              "snippets"
              "path"
              "buffer"
            ];
            transform_items = lib.mkLuaInline ''
              function(_, items)
                return vim.tbl_filter(function(item)
                  return not (
                    item.kind == require("blink.cmp.types").CompletionItemKind.Snippet
                    and item.source_name == "LSP"
                  )
                end, items)
              end
            '';
          };
          completion = {
            menu.draw = {
              columns = lib.mkLuaInline ''{ { "kind_icon", "label", "label_description", "source_name", gap = 1 } }'';
              components = {
                label_description.width.max = 50;
                source_name.text = lib.mkLuaInline ''
                  function(ctx)
                    return "[" .. ctx.source_name .. "]"
                  end
                '';
              };
            };
            list.selection.preselect = true;
            documentation = {
              auto_show = true;
              auto_show_delay_ms = 2000;
            };
          };
        };
      };
  };
}
