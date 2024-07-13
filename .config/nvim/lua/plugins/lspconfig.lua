return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "tsserver", "lua_ls" }
      })
    end
  }, {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.tsserver.setup({})
    lspconfig.lua_ls.setup({})

    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  end
}
}
