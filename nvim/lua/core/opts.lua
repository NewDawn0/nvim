local o = vim.opt
-- Line numbering
o.number = true
o.relativenumber = true
-- Tab & indent
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.smarttab  = true
o.softtabstop = 2
o.tabstop = 2
-- Behaviour
o.clipboard:append("unnamedplus")
o.confirm = false
o.ignorecase = true
o.mouse = "a"
o.updatetime = 200
-- UI
o.signcolumn = "yes"
o.winborder = "rounded"
o.wrap = false
-- Status & Scroll
o.laststatus = 3
o.linebreak = true
o.scrolloff = 4
o.smoothscroll = true
-- Backup & Undo
o.swapfile = false
o.undofile = true
o.undolevels = 100000
