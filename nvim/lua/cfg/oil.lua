local oil = require("oil")
local toggles = require("core.util").toggles
toggles.oil = false

oil.setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    -- Keep parent
    is_hidden_file = function(name, _)
      if name == ".." then return false end
      return name:match("^%.") ~= nil
    end
  }
})

vim.keymap.set("n", "<leader>ft", function()
  toggles.oil = not toggles.oil
  _ = (toggles.oil and oil.open or oil.close)()
end, {
  desc = "Toggle file explorer",
  noremap = true,
  silent = true,
})
