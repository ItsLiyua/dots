{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps =
      [
        {
          action = "<Esc>";
          key = "jk";
          mode = ["i"];
          options.desc = "Exit insert mode";
        }
        {
          action = "<cmd>wa<CR><cmd>q<CR>";
          key = "<leader>qq";
          options.desc = "Save all files and exit";
        }
        {
          action = "<cmd>vsplit<CR>";
          key = "<leader>sv";
          options.desc = "Split vertically";
        }
        {
          action = "<cmd>split<CR>";
          key = "<leader>sh";
          options.desc = "Split horizontally";
        }
        {
          action = "<C-w>=";
          key = "<leader>se";
          options.desc = "Make splits equal size";
        }
        {
          action = "<cmd>close<CR>";
          key = "<leader>sx";
          options.desc = "Close split";
        }
        {
          action = "<cmd>bd<CR>";
          key = "<leader>bx";
          options.desc = "Close buffer";
        }
        {
          action = "<cmd>enew<CR>";
          key = "<leader>bo";
          options.desc = "New empty buffer";
        }
        {
          action = "<cmd>noh<CR>";
          key = "<Esc>";
          mode = ["n"];
          options.desc = "Clear highlight";
        }
        {
          action = "<cmd>bd<CR>";
          key = "<leader>e";
          mode = ["n"];
          options = {
            silent = true;
            desc = "Close buffer";
          };
        }
        {
          action = "<cmd>w<CR>";
          key = "<C-s>";
          mode = ["n"];
          options = {
            silent = true;
            desc = "Save file";
          };
        }
        {
          action = "<cmd>bnext<CR>";
          key = "<Tab>";
          options = {
            silent = true;
            desc = "Cycle to next buffer";
          };
          mode = ["n"];
        }
        {
          action = "<cmd>bprevious<CR>";
          key = "<S-Tab>";
          options = {
            silent = true;
            desc = "Cycle to previous buffer";
          };
          mode = ["n"];
        }
        {
          action = "<cmd>wincmd h<CR>";
          key = "<C-h>";
          options.desc = "Move to left split";
        }
        {
          action = "<cmd>wincmd j<CR>";
          key = "<C-j>";
          options.desc = "Move to bottom split";
        }
        {
          action = "<cmd>wincmd k<CR>";
          key = "<C-k>";
          options.desc = "Move to top split";
        }
        {
          action = "<cmd>wincmd l<CR>";
          key = "<C-l>";
          options.desc = "Move to right split";
        }
        {
          action = "~h";
          key = "<leader>mt";
          options.desc = "Toggle case";
        }
      ]
      ++ map (key: {
        action = "<Nop>";
        key = "<${key}>";
        options.silent = true;
        mode = ["n" "i" "v"];
      }) ["Up" "Down" "Left" "Right"]; # Disable Arrow Keys
  };
}
