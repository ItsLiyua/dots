{ config, ... }:
{
  programs.nvf.settings.vim.tabline.nvimBufferline = {
    enable = true;
    setupOpts = {
      options = {
        mode = "buffers";
        themable = true;
        numbers = "ordinal";
        diagnostics = "nvim_lsp";
        color_icons = true;
        show_buffer_icons = true;
        always_show_bufferline = true;
      };
      highlights.fill.bg = config.lib.stylix.colors.withHashtag.base01 or "#000000";
    };
    mappings = {
      closeCurrent = "<leader>e";
      cycleNext = "<Tab>";
      cyclePrevious = "<S-Tab>";
      moveNext = "<C-Tab>";
      movePrevious = "<C-S-Tab>";
    };
  };
}
