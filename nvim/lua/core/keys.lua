local keymaps = {
  n = {
    ["<leader>w"] = { ":write<CR>", desc = "Save buffer" },
    ["<leader>q"] = { ":quit<CR>",  desc = "Quit buffer" },
    ["<leader>lf"] = { ":lua vim.lsp.buf.format()<CR>", desc = "Format buffer" },
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
