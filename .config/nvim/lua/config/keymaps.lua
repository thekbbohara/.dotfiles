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

-- moves oneword forward or backward
keymap.set("i", "<C-w>", "<Esc>wli", opts)
keymap.set("i", "<C-b>", "<Esc>bi", opts)

keymap.set("n", "x", '"_x')

--increment / decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split
keymap.set("n", "ss", ":vsplit<cr>", opts)
keymap.set("n", "sh", ":split<cr>", opts)
