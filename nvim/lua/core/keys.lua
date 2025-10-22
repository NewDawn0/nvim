-- Setup toggles
local util = require("core.util")
local toggle = require("better-toggle")
local toggles = toggle.toggles
local sort = require("better-sort")

-- Toggles
local diagt = toggle.new(nil, {
  on = function(v)
    vim.diagnostic.config({ virtual_text = v })
  end
})

toggles["autoFormat"] = toggle.new()
toggles["autoFormat"].next()

-- Set up inital state
vim.diagnostic.config({
  virtual_text = diagt:val(),
})

util.setKeymap({
  n = {
    ["<leader>w"] = { ":write<CR>", desc = "Save buffer" },
    ["<leader>q"] = { ":quit<CR>", desc = "Quit buffer" },
    ["<leader>lf"] = { vim.lsp.buf.format, desc = "Format buffer" },
    ["<leader>lr"] = { vim.lsp.buf.rename, desc = "Rename symbol" },
    ["<leader>td"] = { diagt.next, desc = "Toggle inline diagnostics" },
    ["<leader>tf"] = { toggles["autoFormat"].next, desc = "Toggle auto formatting" },
  },
  v = {
    ["<"] = { "<gv", desc = "Unindent selection" },
    [">"] = { ">gv", desc = "Indent selection" },
    ["<leader>sc"] = { sort.chars, desc = "Sort lines" },
    ["<leader>sw"] = { sort.words, desc = "Sort words" },
    ["<leader>sl"] = { sort.lines, desc = "Sort lines" },
    ["<leader>ss"] = { ":sort<CR>", desc = "Sort lines" },
  },
  [{ "n", "v" }] = {
    ["<leader>h"] = { ":nohlsearch<CR>", desc = "Disable search hl" },
  }
})
