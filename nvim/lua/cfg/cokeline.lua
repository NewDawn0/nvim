local coke = require("cokeline")
local cokeMap = require("cokeline.mappings")
local setKeymap = require("core.util").setKeymap

coke.setup({
	show_if_buffers_are_at_least = 1,
	default_hl = {
		bg = function(buffer)
			return buffer.is_focused and "TabLineSel" or "Normal"
		end,
		fg = function(buffer)
			return buffer.is_focused and "TabLineSel" or "Normal"
		end,
	},
	components = {
		{
			text = function(buffer)
				return (buffer.index ~= 1) and "▏" or ""
			end,
		},
		{
			text = function(buffer)
				return "  " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.filename .. "  "
			end,
			bold = function(buffer)
				return buffer.is_focused
			end,
		},
		{
			text = "x",
			on_click = function(_, _, _, _, buffer)
				buffer:delete()
			end,
		},
		{
			text = "  ",
		},
	},
})

local function bufDel()
	require("cokeline.utils").buf_delete(vim.api.nvim_get_current_buf(), false)
end

setKeymap({
  n = {
    ["<leader>bn"] = { "<Plug>(cokeline-focus-next)", desc = "Next buffer" },
    ["<leader>bp"] = { "<Plug>(cokeline-focus-prev)", desc = "Previous buffer" },
    ["<leader>bd"] = { bufDel, desc = "Close current buffer" },
  }
})
