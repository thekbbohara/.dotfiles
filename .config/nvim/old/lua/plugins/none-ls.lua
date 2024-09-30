return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "gbprod/none-ls-shellcheck.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.completion.spell,
        require("none-ls.code_actions.eslint"),
        require("none-ls-shellcheck.diagnostics"),
        require("none-ls-shellcheck.code_actions"),
      },
    })
    -- Add keybinding for formatting
    vim.api.nvim_set_keymap(
      "n",
      "<leader>fm",
      "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
      { noremap = true, silent = true }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>w",
      "<cmd>lua vim.lsp.buf.format({ async = true })<CR>:w<CR>",
      { noremap = true, silent = true }
    )
  end,
}
