local oil = require("oil")
local util = require("core.util")
util.toggles.oil = false

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

local function toggleOil()
  util.toggles.oil = not util.toggles.oil
  _ = (util.toggles.oil and oil.open or oil.close)()
end

util.setKeymap({
  n = {
    ["<leader>ft"] = { toggleOil, desc = "Toggle file explorer"},
  }
})
