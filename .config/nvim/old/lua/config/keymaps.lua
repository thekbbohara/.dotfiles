-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- key mapping
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- write and quit with leader w/q
-- keymap.set("n","<leader>w",":w<cr>",opts) -- available on none-ls.lua
keymap.set("n", "<leader>q", ":wq<cr>", opts)

-- open :NvimTree with leader nt
keymap.set("n", "<leader>nt", ":NvimTreeOpen<cr>")

-- go to command mode with esc from normal mode
keymap.set("n", "<Esc>", ":")

-- buffer
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous Buffer" })

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
-- keymap.set("i", "<C-H>", "<Esc>^i", opts)
-- keymap.set("i", "<C-L>", "<Esc>$a", opts)

-- moves oneword forward or backward
keymap.set("i", "<C-w>", "<Esc>wli", opts)
keymap.set("i", "<C-b>", "<Esc>bi", opts)
-- delete in _ reg
keymap.set({ "v", "n" }, "x", '"_x', opts)
keymap.set({ "n", "v" }, "dx", '"_dd', opts)

--select all
keymap.set("n", "<C-a>", "gg0vG$", opts)

--increment / decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Split
keymap.set("n", "ss", ":vsplit<cr>", opts)
keymap.set("n", "sh", ":split<cr>", opts)

