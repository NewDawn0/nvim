-- Setup toggles
local util = require("core.util")
util.toggles.showDiag = true
util.toggles.autoFormat = true

-- Toggle functions
local function toggleDiag()
  util.toggles.showDiag = not util.toggles.showDiag
  vim.diagnostic.config({
    virtual_text = util.toggles.showDiag,
  })
end
local function toggleFmt()
  toggles.autoFormat = not util.toggles.autoFormat
end

-- Set up inital state
vim.diagnostic.config({
  virtual_text = util.toggles.showDiag,
})

util.setKeymap({
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
})
