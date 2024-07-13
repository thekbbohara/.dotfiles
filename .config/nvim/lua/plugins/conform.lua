return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				lua = { "stylua" },
				-- Use a sub-list to run only the first available formatter
				javascript = { { "prettierd", "prettier" } },
			},

			format_on_save = {

				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})
	end,
}
