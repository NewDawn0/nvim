local M = {}

---Get the lines from the selection
---@return string[] Lines
local function getSel()
  vim.cmd([[silent normal! "vy]])
  local lines = vim.split(vim.fn.getreg("v"), "\n")
  if lines[#lines] == "" then
    table.remove(lines)
  end
  return lines
end

---Set Replace lines in the selection
---@param lines string[] Lines
local function setSel(lines)
  local reg = vim.fn.getregtype("v")
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd("silent normal! gvd")
  vim.api.nvim_put(lines, reg, false, false)
end

M.lines = function()
  local lines = getSel()
  table.sort(lines)
  setSel(lines)
end

M.words = function()
  local lines = getSel()
  for i, line in ipairs(lines) do
    local words = vim.split(line, " ")
    table.sort(words)
    lines[i] = table.concat(words, " ")
  end
  table.sort(lines)
  setSel(lines)
end

M.chars = function()
  local lines = getSel()
  for i, line in ipairs(lines) do
    local words = vim.split(line, "")
    table.sort(words)
    lines[i] = table.concat(words, "")
  end
  table.sort(lines)
  setSel(lines)
end

return M
