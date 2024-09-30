return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Go to next hunk" })

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Go to previous hunk" })

				-- Actions
				map("n", "<leader>sch", gitsigns.stage_hunk, { desc = "Stage current hunk" })
				map("n", "<leader>rch", gitsigns.reset_hunk, { desc = "Reset current hunk" })
				map("v", "<leader>ssh", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage selected hunk" })
				map("v", "<leader>rsh", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset selected hunk" })
				map("n", "<leader>seb", gitsigns.stage_buffer, { desc = "Stage entire buffer" })
				map("n", "<leader>ush", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>reb", gitsigns.reset_buffer, { desc = "Reset entire buffer" })
				map("n", "<leader>pch", gitsigns.preview_hunk, { desc = "Preview current hunk" })
				map("n", "<leader>bcl", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame current line" })
				map("n", "<leader>tlb", gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
				map("n", "<leader>sdf", gitsigns.diffthis, { desc = "Show diff for current file" })
				map("n", "<leader>sDf", function()
					gitsigns.diffthis("~")
				end, { desc = "Show diff for current file (against last commit)" })
				map("n", "<leader>tdl", gitsigns.toggle_deleted, { desc = "Toggle deleted lines" })

				-- Text object
				map({ "o", "x" }, "<leader>hs", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
			end,
		})
	end,
}
