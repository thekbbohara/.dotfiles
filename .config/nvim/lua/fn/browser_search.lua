local M = {} -- create a module

local open_command = "xdg-open"
if vim.fn.has("mac") == 1 then
  open_command = "open"
end

local function is_valid_url(url)
  return string.match(url, "^https?://[%w%._-]+%.[%w%._-]+") ~= nil
end

function M.get_selected_or_cursor_word()
  local mode = vim.fn.visualmode()
  if mode then
    -- Get the selected text in visual mode
    local start_line = vim.fn.line("'<")             -- Starting line of the selection
    local end_line = vim.fn.line("'>")               -- Ending line of the selection
    local lines = vim.fn.getline(start_line, end_line) -- Get the lines in the selection

    -- If the selection spans multiple lines, join them
    local selected_text = table.concat(lines, "\n")

    -- Trim the selected text to only include what was selected
    -- Check for the exact character range if necessary
    local start_col = vim.fn.col("'<") -- Starting column of the selection
    local end_col = vim.fn.col("'>") -- Ending column of the selection

    -- If the selection is within a single line, extract that
    if start_line == end_line then
      return selected_text:sub(start_col, end_col)
    end

    return selected_text
  else
    -- Get the word under the cursor
    return vim.fn.expand("<cword>")
  end
end

function M.url_check()
  local cursorword = M.get_selected_or_cursor_word()
  if cursorword ~= nil then
    if is_valid_url(cursorword) then
      return cursorword
    else
      return "https://www.google.com/search?q=" .. cursorword
    end
  else
    -- print("No word dedected," .. cursorword)
    return "No word dedected," .. cursorword
  end
end

function M.open_in_browser()
  local url = M.url_check()
  vim.fn.jobstart({ open_command, url }, { detach = true })
end

--[[ -- Command to check the URL
vim.api.nvim_create_user_command("UrlCheck", function()
  local url = M.url_check() -- Call the url_check function
  print(url)               -- Print the result to the command line
end, {}) ]]

-- Command to get the current word
vim.api.nvim_create_user_command("CurrentWord", function()
  local currentWord = M.get_selected_or_cursor_word()
  print(currentWord) -- Output the current word to the command line
end, {})
-- https://hello_world.com
-- Open in browser
vim.api.nvim_create_user_command("Browse", function()
  M.open_in_browser()
end, {})
