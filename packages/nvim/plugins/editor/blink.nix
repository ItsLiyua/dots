{
  vim.autocomplete.blink-cmp = {
    enable = true;
    mappings = {
      close = null;
      complete = null;
      confirm = null;
      next = null;
      previous = null;
      scrollDocsDown = null;
      scrollDocsUp = null;
    };
    setupOpts = {
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
        "<Up>" = [
          "select_prev"
          "fallback"
        ];
        "<Down>" = [
          "select_next"
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
          "snippet_forward"
        ];
      };
      appearance = {
        use_nvim_cmp_as_default = true;
        nerd_font_variant = "mono";
      };
    };
  };
}
