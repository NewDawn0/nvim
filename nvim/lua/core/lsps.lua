local configs = { }
local support =  {
  ansible = {"ansiblels"},
  arduino = {"arduino_language_server"},
  assembly = {"asm_lsp"},
  lua = {"lua_ls"},
  nix = {"nixd", "nil"},
}

local function allEnabled()
  return vim.g.support.all ~= nil and vim.g.support.all
end
local function enabled(lang)
  return vim.g.support[lang] ~= nil and vim.g.support[lang]
end

-- Configure Lsps
for lsp, cfg in pairs(configs) do
  vim.lsp.config[lsp] = cfg
end

-- Enable Lsps
if allEnabled() then
  vim.lsp.enable(vim.tbl_flatten(vim.tbl_values(support)))
else
  for lang, lsp in pairs(support) do
    if enabled(lang) then
      vim.lsp.enable(lsp)
    end
  end
end
