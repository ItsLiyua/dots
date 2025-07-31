{
  programs.nvf.settings.vim.keymaps = [
    {
      key = "<esc>";
      mode = "n";
      action = "<cmd>nohl<cr>";
      desc = "Disables highlighting";
      silent = true;
    }
    {
      key = "jk";
      mode = "i";
      action = "<ESC>";
      desc = "Exit insert mode";
      silent = true;
    }
    {
      key = "<leader>sv";
      mode = "n";
      action = "<cmd>vs<CR>";
      desc = "Split vertically";
    }
    {
      key = "<leader>sh";
      mode = "n";
      action = "<cmd>sp<CR>";
      desc = "Split horizontally";
    }
    {
      key = "<leader>snv";
      mode = "n";
      action = "<cmd>vnew<CR>";
      desc = "Create empty split to the right";
    }
    {
      key = "<leader>snh";
      mode = "n";
      action = "<cmd>new<CR>";
      desc = "Create empty split to the bottom";
    }
    {
      key = "<leader>s=";
      mode = "n";
      action = "<C-W>=";
      desc = "Make splits equal size";
    }
    {
      key = "<C-.>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>resize +2<CR>";
      desc = "Increase split width";
    }
    {
      key = "<C-S-.>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>resize -2<CR>";
      desc = "Decrease split width";
    }
    {
      key = "<C-,>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>vertical resize +2<CR>";
      desc = "Increase split height";
    }
    {
      key = "<C-S-,>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>vertical resize -2<CR>";
      desc = "Decrease split height";
    }
    {
      key = "<C-h>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>wincmd h<CR>";
      desc = "Move to left split";
    }
    {
      key = "<C-j>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>wincmd j<CR>";
      desc = "Move to lower split";
    }
    {
      key = "<C-k>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>wincmd k<CR>";
      desc = "Move to upper split";
    }
    {
      key = "<C-l>";
      mode = [
        "n"
        "v"
        "x"
      ];
      action = "<cmd>wincmd l<CR>";
      desc = "Move to right split";
    }
  ];
}
