return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      separator_style = { "", "" },
      indicator = {
        style = "underline",
      },
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true
        }
      },
    },
    highlights = {
      separator_selected = {
        sp = "#FF0000"
      }
    }
  },
}
