local setKeymap = require("core.util").setKeymap

local keymaps = {
  [{ "c", "n", "v" }] = {
    ["<C-h>"] = { "<ESC>:TmuxNavigateLeft<CR>", desc = "Move left" },
    ["<C-j>"] = { "<ESC>:TmuxNavigateDown<CR>", desc = "Move down" },
    ["<C-k>"] = { "<ESC>:TmuxNavigateUp<CR>", desc = "Move up" },
    ["<C-l>"] = { "<ESC>:TmuxNavigateRight<CR>", desc = "Move right" },
  }
}

setKeymap(keymaps)
