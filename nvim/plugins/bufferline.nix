{
  programs.nixvim.plugins.bufferline = {
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
        always_show_bufferline = false;
        auto_toggle_bufferline = true;
      };
    };
  };
}
