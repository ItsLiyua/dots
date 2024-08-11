return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    keys = {
      "<leader>co",
      "<leader>cc",
      "<leader>cv",
    },
    config = function()
      require("compiler").setup()

      -- Open compiler
      vim.keymap.set("n", "<leader>co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

      -- Redo last selected option
      vim.keymap.set("n", "<leader>cc",
        "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
        .. "<cmd>CompilerRedo<cr>",
        { noremap = true, silent = true })

      -- Toggle compiler results
      vim.keymap.set("n", "<leader>cv", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
    end,
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1
      },
    },
  },
}
