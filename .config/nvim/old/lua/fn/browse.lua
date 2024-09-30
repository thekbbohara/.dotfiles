local M = {}
local function extractLink(query)
	local link = query
	if string.find(link, "//") then
		link = link:match("//(.+)") -- Extract part after '//' using pattern matching
		if string.find(link, "/") then
			link = link:match("([^/]+)") -- Extract part before the first '/'
		end
	else
		if string.find(link, "/") then
			link = link:match("([^/]+)") -- Extract part before the first '/'
		end
	end
	return link
end
local function ping(url)
	local cmd = string.format("ping -c 1 %s > /dev/null 2>&1", extractLink(url))
	local result = os.execute(cmd)
	return result == 0 -- returns true if the ping is successful
end

local function get_current_mode()
	-- Switch to normal mode and get the current mode
	vim.cmd("normal! gv") -- Reselect the visual selection
	local mode = vim.api.nvim_get_mode().mode -- Get current mode
	print("mode " .. mode)
	return mode
end

local function vExtractSelectedText()
	-- Get the start and end positions of the visual selection
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")
	local rowStart = vstart[2]
	local rowEnd = vend[2]
	local colStart = vstart[3]
	local colEnd = vend[3]
	-- Get the selected lines
	local lines = vim.fn.getline(rowStart, rowEnd)
	-- print("lines" .. vim.inspect(lines))
	local selected_text = ""
	if rowStart == rowEnd then
		selected_text = lines[1]:sub(colStart, colEnd)
	else
		selected_text = lines[1]:sub(colStart)
		for i = 2, #lines - 1 do
			selected_text = selected_text .. "\n" .. lines[i]
		end
		selected_text = selected_text .. "\n" .. lines[#lines]:sub(1, colEnd)
	end
	return selected_text
end

local function getSelectedText()
	local current_mode = get_current_mode()
	if current_mode == "v" then
		local selected_text = vExtractSelectedText()
		return selected_text
	else
		-- local line = vim.api.nvim_get_current_line()
		local current_word = vim.fn.expand("<c-word>")
		print("current_word" .. current_word)
		return current_word
	end
end

function M.googleQuery()
	local query = getSelectedText()
	if query == "" then
		print("unable to getSelectedText")
		return
	end
	print("query " .. query)
	local isValidLink = ping(query)
	if isValidLink == false then
		query = "https://google.com/search?q=" .. query
	end
	vim.fn.jobstart({ "google-chrome-stable", query })
end

-- testurl: https://github.com/thekbbohara

-- Create a user command to invoke the function
-- vim.api.nvim_create_user_command("Browse", M.googleQuery, { range = true })
-- vim.api.nvim_create_user_command("CurrentMode", get_current_mode, { range = true })

-- Set up the key mapping for the Browse command
-- vim.keymap.set({ "n", "v" }, "gx", ":Browse<CR>", { noremap = true, silent = true })
return M
