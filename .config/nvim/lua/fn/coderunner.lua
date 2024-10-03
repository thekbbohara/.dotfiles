local M = {}
local executables = {
  js = "node", --javascript
  py = "python", --python
  lua = "lua", --lua
  rb = "ruby", --ruby
  java = "java", --java
  php = "php", --php
  go = "go", --go
  rs = "cargo run", --rust
  ts = "ts-node", --typescript
}

local filename = vim.fn.expand("%:p")
local extension = filename:match("^.+%.(.+)$")

local function ExecuteCode()
  if extension and executables[extension] then
    local command = executables[extension] .. " " .. filename
    vim.cmd("!" .. command)
  else
    print("No executable found for the file type: ." .. (extension or "unknown"))
  end
end

local function ExecuteCodeInTerminal(direction)
  if extension and executables[extension] then
    local command = executables[extension] .. " " .. filename
    local toggleConfig = "TermExec name=coderunner size=40 dir=./ direction="
      .. direction
      .. " "
      .. "cmd="
      .. "'"
      .. command
      .. "'"
    vim.cmd(toggleConfig)
  else
    print("No executable found for the file type: ." .. (extension or "unknown"))
  end
end

vim.api.nvim_create_user_command("ExecuteCode", ExecuteCode, { desc = "Execute code in the current buffer" })
vim.api.nvim_create_user_command("ExecuteCodeVertical", function()
  ExecuteCodeInTerminal("vertical")
end, { desc = "Execute code in a vertical terminal" })
vim.api.nvim_create_user_command("ExecuteCodeHorizontal", function()
  ExecuteCodeInTerminal("horizontal")
end, { desc = "Execute code in a horizontal terminal" })
vim.api.nvim_create_user_command("ExecuteCodeFloat", function()
  ExecuteCodeInTerminal("float")
end, { desc = "Execute code in a floating terminal" })
vim.api.nvim_create_user_command("ExecuteCodeTab", function()
  ExecuteCodeInTerminal("tab")
end, { desc = "Execute code in a new tab" })

vim.keymap.set("n", "<leader>rc", "<cmd>ExecuteCode<cr>", { noremap = true, silent = true, desc = "ExecuteCode" })
vim.keymap.set("n", "<leader>rt", "<cmd>ExecuteCodeTab<cr>", { desc = "ExecuteCode in tab." })
vim.keymap.set("n", "<leader>rf", "<cmd>ExecuteCodeFloat<cr>", { desc = "ExecuteCode in floating terminal." })
vim.keymap.set("n", "<leader>rv", "<cmd>ExecuteCodeVertical<cr>", { desc = "ExecuteCode in vertical terminal." })
vim.keymap.set("n", "<leader>rh", "<cmd>ExecuteCodeHorizontal<cr>", { desc = "ExecuteCode in horizontal terminal." })
return M
