vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", ":enew<CR>", { desc = "Opens new tab" })
keymap.set("n", "<leader>tx", ":bp<bar>sp<bar>bn<bar>bd<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", ":bnext<CR>", { desc = "Go to next tab" })
keymap.set({ "n" }, "<Tab>", ":bnext<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", ":bprevious<CR>", { desc = "Go to previous tab" })
keymap.set({ "n" }, "<S-Tab>", ":bprevious<CR>", { desc = "Go to previous tab" })
