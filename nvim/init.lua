vim.g.mapleader = " "

-- TODO: Finish TODOS
-- [ ] Add lazy loading using pcall-me-maybe
-- [ ] Make support modular like nvim-treeshitter
-- [ ] Rewrite b16 nvim
-- [ ] Add dap
-- [ ] Fix telescope UI
-- [ ] Add EBNF lsp & tester
-- [ ] Add latex toolkit
-- [ ] Check lsps & add functionality
-- [ ] Create table formatter (haskell maybe)
-- [ ] Add git support with ui
-- [ ] Add doc support
-- [ ] Add latex luasnip snippets

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
-- Plugin: with deps
require("opt.snippets")
require("opt.cmp")
