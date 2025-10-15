local map = vim.keymap.set
local telescope = require("telescope")

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

telescope.load_extension("dap")
telescope.load_extension("fzf")
telescope.load_extension("conflicts")
telescope.load_extension("media_files")

-- map("n", "<leader>dc", ":Telescope dap commands<CR>")
-- map("n", "<leader>dC", ":Telescope dap configurations<CR>")
-- map("n", "<leader>dP", ":Telescope dap list_breakpoints<CR>")
-- map("n", "<leader>dv", ":Telescope dap variables<CR>")
-- map("n", "<leader>df", ":Telescope dap frames<CR>")

map("n", "<leader>fu", ":Telescope undo<CR>")
map("n", "<leader>fgc", ":Telescope conflicts<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fld", ":Telescope diagnostics<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fgC", ":Telescope git_commits<CR>")
map("n", "<leader>fll", ":Telescope lsp_symbols<CR>")
map("n", "<leader>fn", ":Telescope notify<CR>")
map("n", "<leader>fs", ":Telescope live_grep<CR>")
map("n", "<leader>fm", ":Telescope media_files<CR>")
