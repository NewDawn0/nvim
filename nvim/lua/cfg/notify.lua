local notify = require("notify")
vim.notify = notify
notify.setup {
  -- NOTE: Unused but keeps away warnings
  background_colour = "#000000",
  timeout = 300,
}
