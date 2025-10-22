local setKeymap = require("core.util").setKeymap
local telescope = require("telescope")

telescope.setup {
	extensions = {
		fzf = {
			fuzzy = true,
			case_mode = "smart_case",
			override_file_sorter = true,
			override_generic_sorter = true,
		},
	},
}

for _, ext in ipairs({"conflicts", "dap", "fzf"}) do
	telescope.load_extension(ext)
end

setKeymap({
	n = {
		["<leader>fb"] 	= { ":Telescope buffers<CR>", 			desc = "Find buffers" },
		["<leader>ff"] 	= { ":Telescope find_files<CR>", 		desc = "Find files" },
		["<leader>fF"] 	= {	":Telescope oldfiles<CR>",			desc = "Find old files"},
		["<leader>fgb"] = { ":Telescope git_branches<CR>",	desc = "Find git branches" },
		["<leader>fgc"] = { ":Telescope conflicts<CR>", 		desc = "Find git conflicts" },
		["<leader>fgC"] = { ":Telescope git_commits<CR>", 	desc = "Find git commits" },
		["<leader>fgS"] = { ":Telescope git_stash<CR>", 		desc = "Show git stash" },
		["<leader>fgs"] = { ":Telescope git_status<CR>", 		desc = "Show git status" },
		["<leader>fk"]	= {	":Telescope keymaps<CR>", 			desc = "Find keymaps" },
		["<leader>fld"] = { ":Telescope diagnostics<CR>", 	desc = "Find diagnostics" },
		["<leader>fm"] 	= {	":Telescope marks<CR>", 				desc = "Find marks" },
		["<leader>fn"] 	= { ":Telescope notify<CR>", 				desc = "Find notifications" },
		["<leader>fs"] 	= { ":Telescope live_grep<CR>", 		desc = "Live grep" },
	}
})

-- TODO: Check if these are needed
-- map("n", "<leader>dc", ":Telescope dap commands<CR>")
-- map("n", "<leader>dC", ":Telescope dap configurations<CR>")
-- map("n", "<leader>dP", ":Telescope dap list_breakpoints<CR>")
-- map("n", "<leader>dv", ":Telescope dap variables<CR>")
-- map("n", "<leader>df", ":Telescope dap frames<CR>")
