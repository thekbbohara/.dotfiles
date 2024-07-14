return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
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
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					--["<C-Space>"] = cmp.mapping.complete(),
					["<A-n>"] = cmp.mapping.select_next_item(),
					["<A-p>"] = cmp.mapping.select_prev_item(),
					["<A-e>"] = cmp.mapping.close(),
					["<A-y>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
					{ name = "path" },
				}),
			})
		end,
	},
}
