return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		-- "hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")
		local ls = require("luasnip")
		-- Load snippets from files
		local javascript_snippets = require("snippits.javascript")
		-- print("Loaded js_snip: ", vim.inspect(javascript_snippets))
		ls.snippets = {
			javascript = javascript_snippets.javascript,
		}
		-- luasnip keymap
		vim.keymap.set({ "i", "s" }, "<A-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		vim.keymap.set({ "i", "s" }, "<A-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		-- End luasnip keymap

		cmp.setup({
			snippet = {
				expand = function(args)
					ls.lsp_expand(args.body)
				end,
			},
			mapping = {
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-e>"] = cmp.mapping.close(),
			},
			sources = {
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				-- { name = "cmdline" },
			},
			-- Add this to enable more automatic suggestions
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
		})
	end,
}
