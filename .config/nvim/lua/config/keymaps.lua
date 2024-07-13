-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- key mapping
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- insert to normalkeymap
keymap.set("i", "jk", "<Esc>")
keymap.set("i", "<C-j>", "<Esc>ja", opts)
keymap.set("i", "<C-k>", "<Esc>ka", opts)
keymap.set("i", "<C-h>", "<Esc>i", opts)
keymap.set("i", "<C-l>", "<Esc>la", opts)

-- move lines up an down
-- for insert mode
keymap.set({ "i", "n" }, "<C-S-J>", "<Esc>:m+<cr>", opts)
keymap.set({ "i", "n" }, "<C-S-K>", "<Esc>:m-2<cr>", opts)
keymap.set("i", "<C-S-H>", "<Esc>^i", opts)
keymap.set("i", "<C-S-L>", "<Esc>$a", opts)

-- moves oneword forward or backward
keymap.set("i", "<C-w>", "<Esc>wli", opts)
keymap.set("i", "<C-b>", "<Esc>bi", opts)

-- delete in _ reg
keymap.set({ "v", "n" }, "x", '"_x', opts)
keymap.set({ "n", "v" }, "xd", '"_dd', opts)

--select all
keymap.set("n", "<C-a>", "gg0vG$", opts)

--increment / decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split
keymap.set("n", "ss", ":vsplit<cr>", opts)
keymap.set("n", "sh", ":split<cr>", opts)
