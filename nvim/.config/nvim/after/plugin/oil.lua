require("oil").setup({
	columns = { "icon" },
	keymaps = {
		["<C-v>"] = "actions.select_split",
		["q"] = "actions.close",
	},
	view_options = {
		show_hidden = true,
	},
})

-- Open parent directory in current window
vim.keymap.set("n", "-", "<CMD>Oil<CR>")