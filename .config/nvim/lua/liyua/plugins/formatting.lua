return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    local format_opts = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    }


    conform.setup({
      formatters_by_ft = {
        python = { "isort", "black" },
      },
      -- format_on_save = format_opts
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format(format_opts)
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
