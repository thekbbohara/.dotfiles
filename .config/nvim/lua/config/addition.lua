require("neo-tree").setup({
  close_if_last_window = false,
  popup_border_style = "rounded",
  window = {
    position = "right", -- Set the position to 'right'
    width = 40, -- Adjust width as needed
    mapping_options = {
      noremap = true,
      nowait = true,
    },
  },
  -- Other configuration options
})
vim.api.nvim_set_keymap("n", "<leader>nt", ":Neotree toggle<CR>", { noremap = true, silent = true })
