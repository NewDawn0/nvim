local lsp = vim.lsp

---@param name string Name of the language
local function enabled(name)
  return vim.g.support["all"] or vim.g.support[name]
end

if enabled("lua") then
  lsp.enable({"lua_ls"})
end
