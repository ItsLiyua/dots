return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "uZer/pywal16.nvim" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")
    
    lualine.setup({
      options = {
        theme = "pywal16-nvim",
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
