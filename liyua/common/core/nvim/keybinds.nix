{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "<esc>";
      mode = "n";
      action = "<cmd>nohl<cr>";
      desc = "Disables highlighting";
      silent = true;
    }
  ];
}
