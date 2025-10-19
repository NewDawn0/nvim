vim.g.mapleader = " "
vim.g.toggles = vim.g.toggles or {}
-- Core
require("core.aucmd")
require("core.keys")
require("core.lsps")
require("core.opts")
require("core.ui")
-- Plugins: With setup-fn
require("mini.pairs").setup {}
require("typst-preview").setup {}
-- Plugins: With file
require("opt.boole")
require("opt.cokeline")
require("opt.colorizer")
require("opt.notify")
require("opt.oil")
require("opt.supermaven")
require("opt.surround")
require("opt.telescope")
require("opt.theme")
require("opt.tmux")
require("opt.trim")
-- PluginoptWith deps
require("opt.snippets")
require("opt.cmp")
