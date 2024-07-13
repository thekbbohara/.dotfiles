--[[

=====================================================================
====================   The love of all's hand   ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||       NEOVIM       ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:kbzvim             ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
--]]

-- Path to your config directory
local config_stdpath = vim.fn.stdpath("config")
local config_dir = config_stdpath .. "/lua/config"
-- Function to load Lua files from a directory
local function load_config_files()
	local files = vim.fn.readdir(config_dir)
	if not files then
		return
	end

	for _, file in ipairs(files) do
		-- Check if the file is a Lua file (ends with .lua)
		if file:match("%.lua$") then
			-- Construct full path to the Lua file
			local module_name = file:sub(1, -5) -- Remove ".lua" extension
			local module_path = "config" .. "." .. file

			-- Attempt to load the Lua file as a module
			local ok, err = pcall(require, "config." .. module_name)
			if not ok then
				print("Error loading config file " .. module_name .. ": " .. err)
			end
		end
	end
end

-- Load config files
load_config_files()
--require("config.keymaps")
--require("config.options")
--so on

-- Load nvim lazy plugin manager
require("lazy.lazy")
