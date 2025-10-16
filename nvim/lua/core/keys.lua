-- Setup toggles
local toggles = require("core.util").toggles
toggles.showDiag = true
toggles.autoFormat = true

-- Toggle functions
local function toggleDiag()
  toggles.showDiag = not toggles.showDiag
  vim.diagnostic.config({
    virtual_text = toggles.showDiag,
  })
end
local function toggleFmt()
  toggles.autoFormat = not toggles.autoFormat
end

-- Set up inital state
vim.diagnostic.config({
  virtual_text = toggles.showDiag,
})

local keymaps = {
  n = {
    ["<leader>w"] = { ":write<CR>", desc = "Save buffer" },
    ["<leader>q"] = { ":quit<CR>",  desc = "Quit buffer" },
    ["<leader>lf"] = { vim.lsp.buf.format, desc = "Format buffer" },
    ["<leader>ltd"] = { toggleDiag, desc = "Toggle inline diagnostics" },
    ["<leader>ltf"] = { toggleFmt, desc = "Toggle auto formatting" },
  },
  v = {
    ["<"] = {"<gv", desc = "Unindent selection"},
    [">"] = {">gv", desc = "Indent selection"},
    ["<leader>ss"] = { ":sort<CR>", desc = "Sort lines" },
  },
  [{"n", "v"}] = {
    ["<leader>h"] = { ":nohlsearch<CR>", desc = "Disable search hl" },
  }
}

for mode, maps in pairs(keymaps) do
  for key, cmd in pairs(maps) do
    vim.keymap.set(mode, key, cmd[1], { silent = true, noremap = true, desc = cmd.desc })
  end
end
