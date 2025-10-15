vim.g.mapleader = " "
require("core.opts")
require("core.keys")
require("core.lsps")
require("core.ui")

-- Plugins
require("mini.pairs").setup {}
require("cfg.boole")
require("cfg.notify")
require("cfg.oil")
require("cfg.theme")
require("cfg.trim")
require("cfg.supermaven")

require("cfg.snippets")
require("cfg.cmp")
