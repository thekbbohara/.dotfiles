return {
  "thekbbohara/browse_nvim",
  config = function()
    require("browse_nvim").setup()
  end,
  vim.keymap.set({ "v" }, "gq", ":QueryGoogle<CR>", { noremap = true, silent = true }),
  vim.keymap.set({ "n", "v" }, "gx", ":GoToLink<CR>", { noremap = true, silent = true }),
}
