vim.g.mapleader = " "
vim.g.toggles = vim.g.toggles or {}
-- Core
require("core.opts")
require("core.keys")
require("core.aucmd")
require("core.lsps")
require("core.ui")

-- Plugins
require("mini.pairs").setup {}
require("cfg.boole")
require("cfg.notify")
require("cfg.oil")
require("cfg.supermaven")
require("cfg.surround")
require("cfg.telescope")
require("cfg.theme")
require("cfg.trim")

require("cfg.snippets")
require("cfg.cmp")
