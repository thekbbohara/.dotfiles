return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
        side="right"
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = false,
			},
		})
		vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })
	end,
}
