local aucmd = vim.api.nvim_create_autocmd
local fn = vim.fn
local bo = vim.bo
local toggles = require("core.util").toggles

-- Fix asm comment-string for fasm & nasm style
aucmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.asm", "*.nasm", "*.inc" },
	callback = function()
		bo.filetype = "asm"
		bo.commentstring = "; %s"
	end,
})

-- Create missing dirs for writing to path (excluding oil:// files)
aucmd("BufWritePre", {
	callback = function(args)
		local name = vim.api.nvim_buf_get_name(args.buf)
		if name:match([[^oil://]]) then return end
		fn.mkdir(fn.fnamemodify(args.file, ":h"), "p")
	end,
})

-- Automatically reload file if changed
aucmd({ "BufEnter", "CursorHold", "FocusGained" }, {
	callback = function()
		vim.cmd([[silent! checktime %s]])
	end,
})

-- Automatically resize windows when screen size changes
aucmd("VimResized", {
	callback = function()
		vim.cmd([[silent! tabdo wincmd =]])
	end,
})

-- Highlight on yank
aucmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})

-- Return to position when opening files
aucmd("BufReadPost", {
	callback = function()
		if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
			fn.setpos(".", fn.getpos("'\""))
			vim.cmd([[silent! foldopen]])
		end
	end,
})

aucmd("BufWritePre", {
  callback = function()
    if toggles.autoFormat then
      vim.lsp.buf.format({ async = true })
    end
  end
})

-- Display last write time
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = "UserConf",
-- 	callback = function()
-- 		local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:.")
-- 		local lines = vim.api.nvim_buf_line_count(0)
-- 		local time = os.date("%I:%M:%S%p")
--
-- 		local msgParts = {
-- 			{ time .. " ", "SaveMsgTime" },
-- 			{ path .. " ", "SaveMsgPath" },
-- 			{ lines .. "L", "SaveMsgLines" },
-- 		}
--
-- 		vim.api.nvim_echo({ { "", "None" } }, false, {})
-- 		vim.cmd.redraw()
-- 		vim.api.nvim_echo(msgParts, false, {})
-- 	end,
-- })
