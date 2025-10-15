local telescope = require("telescope")

local extensions = {"conflicts", "dap", "fzf"}
telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})

for _, ext in ipairs(extensions) do
	telescope.load_extension(ext)
end

local keybinds = {
	["<leader>fb"] 	= { ":Telescope buffers<CR>", 			desc = "Find buffers" },
	["<leader>ff"] 	= { ":Telescope find_files<CR>", 		desc = "Find files" },
	["<leader>fgC"] = { ":Telescope git_commits<CR>", 	desc = "Find git commits" },
	["<leader>fgb"] = { ":Telescope git_branches<CR>", 	desc = "Find git branches" },
	["<leader>fgc"] = { ":Telescope conflicts<CR>", 		desc = "Find git conflicts" },
	["<leader>fgs"] = { ":Telescope git_status<CR>", 		desc = "Show git status" },
	["<leader>fld"] = { ":Telescope diagnostics<CR>", 	desc = "Find diagnostics" },
	["<leader>fn"] 	= { ":Telescope notify<CR>", 				desc = "Find notifications" },
	["<leader>fs"] 	= { ":Telescope live_grep<CR>", 		desc = "Live grep" },
}
for key, cmd in pairs(keybinds) do
	vim.keymap.set("n", key, cmd[1], { silent = true, noremap = true, desc = cmd.desc })
end
-- map("n", "<leader>dc", ":Telescope dap commands<CR>")
-- map("n", "<leader>dC", ":Telescope dap configurations<CR>")
-- map("n", "<leader>dP", ":Telescope dap list_breakpoints<CR>")
-- map("n", "<leader>dv", ":Telescope dap variables<CR>")
-- map("n", "<leader>df", ":Telescope dap frames<CR>")
