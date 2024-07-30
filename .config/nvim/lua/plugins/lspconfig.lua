return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
          "tsserver",
          "tailwindcss",
          "eslint",
          "bashls",
          "prettierd",
          "lua_ls"
        },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
      --Enable (broadcasting) snippet capability for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      local servers = {"tsserver","html","tailwindcss","eslint","bashls","lua_ls"}
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          capabilities = capabilities
        })
      end
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
