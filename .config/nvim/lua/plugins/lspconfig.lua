return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			--Enable (broadcasting) snippet capability for completion
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities.textDocument.completion.completionItem.snippetSupport = true
			local servers = { "tsserver", "gopls", "html", "tailwindcss", "bashls", "lua_ls", "jsonls" }
			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "show code_action" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
			vim.keymap.set("n", "<leader>sh", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "<C-i>", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "<leader>hsi", vim.lsp.buf.signature_help, { desc = "Signature Help" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
			vim.keymap.set("n", "<leader>sdi", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
		end,
	},
}
