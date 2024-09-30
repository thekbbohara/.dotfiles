return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap
		keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search text in files" })
		keymap.set("n", "<leader>fb", builtin.buffers, { desc = "List open buffers" })
		keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help documentation" })
		keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "List keymaps" })
		-- Telescope setup with ignored patterns
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
			},
		})
	end,
}
