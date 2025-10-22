local oil = require("oil")
local util = require("core.util")
local toggle = require("better-toggle")

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

local oilt = toggle.new(nil, {
  on = function(v)
    _ = (v and oil.open or oil.close)()
  end,
})

util.setKeymap({
  n = {
    ["<leader>ft"] = { oilt.next, desc = "Toggle file explorer"},
  }
})
