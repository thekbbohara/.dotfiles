local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local function move_or_insert(close_char)
	return function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		local current_line = vim.api.nvim_get_current_line()
		if col < #current_line and current_line:sub(col + 1, col + 1) == close_char then
			vim.api.nvim_win_set_cursor(0, { line, col + 1 })
		else
			vim.api.nvim_win_set_cursor(0, { line, col - 1 })
			vim.api.nvim_put({ close_char }, "c", true, true)
		end
	end
end

keymap.set("i", "{", "{}<Esc>i", opts)
keymap.set("i", "[", "[]<Esc>i", opts)
keymap.set("i", "(", "()<Esc>i", opts)
keymap.set("i", "'", "''<Esc>i", opts)
keymap.set("i", '"', '""<Esc>i', opts)

keymap.set("i", "}", move_or_insert("}"), opts)
keymap.set("i", "]", move_or_insert("]"), opts)
keymap.set("i", ")", move_or_insert(")"), opts)
keymap.set("i", "'", move_or_insert("'"), opts)
keymap.set("i", '"', move_or_insert('"'), opts)
