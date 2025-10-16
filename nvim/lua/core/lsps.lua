local lsp = vim.lsp

---@param name string Name of the language
local function enabled(name)
  return vim.g.support.langs["all"] or vim.g.support.langs[name]
end

local perLang = {
  lua = {"lua_ls"},
  nix = {"nixd", "nil"},
}

for lang, lsps in pairs(perLang) do
  if enabled(lang) then
    lsp.enable(lsps)
  end
end
