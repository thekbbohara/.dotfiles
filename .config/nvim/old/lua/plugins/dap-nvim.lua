return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
    local map = vim.keymap.set
		-- Set keymaps to control the debugger
		map("n", "<leader>dc", dap.continue,{ desc = 'Debug start/continue' })
		map("n", "<leader>dt", dap.terminate, {desc = 'Debug terminate'})
		map("n", "<leader>do", dap.step_over, {desc = 'Debug step_over'})
		map("n", "<leader>di", dap.step_into, {desc = 'Debug step_into'})
		map("n", "<leader>du", dap.step_out, {desc = "Debug step_out"})
    map("n", "<leader>dr", dap.repl.toggle, {desc = "Debug repl_toggle"})
		map("n", "<leader>b", dap.toggle_breakpoint,{desc = 'toggle_breakpoint'})
		map("n", "<leader>B", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, {desc = 'set_breakpoint condition'})
	end,
}
