return {
  {

    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end
  },
  {

    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- mason-lspconfig
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "tailwindcss",
          "eslint",
          "bashls",
          "lua_ls"
        },
      })
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      -- mason-nvim-dap
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "vscode-js-debug"
        }
      })
    end
  },
}
