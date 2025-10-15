local oil = require("oil")
local isOpen = false

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
  isOpen = not isOpen
  _ = (isOpen and oil.open or oil.close)()
end, {
  desc = "Toggle file explorer",
  noremap = true,
  silent = true,
})
