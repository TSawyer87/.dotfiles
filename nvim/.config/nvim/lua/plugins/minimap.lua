---@module 'neominimap.config.meta'
return {
	{
		"echasnovski/mini.map",
		version = "*",
		lazy = false,
		enabled = true,
		-- No need to copy this inside `setup()`. Will be used automatically.
		config = function()
			require("mini.map").setup({
				-- Highlight integrations (none by default)
				integrations = nil,

				-- Symbols used to display data
				symbols = {
					-- Encode symbols. See `:h MiniMap.config` for specification and
					-- `:h MiniMap.gen_encode_symbols` for pre-built ones.
					-- Default: solid blocks with 3x2 resolution.
					encode = nil,

					-- Scrollbar parts for view and line. Use empty string to disable any.
					scroll_line = "█",
					scroll_view = "┃",
				},

				-- Window options
				window = {
					-- Whether window is focusable in normal way (with `wincmd` or mouse)
					focusable = false,
					-- Side to stick ('left' or 'right')
					side = "right",
					-- Whether to show count of multiple integration highlights
					show_integration_count = true,
					-- Total width
					width = 10,
					-- Z-index
					zindex = 10,
				},
			})
		end,
	},
	{
		"gorbit99/codewindow.nvim",
		-- dir = "~/codewindow.nvim",
		lazy = false,
		enabled = true,
		init = function()
			vim.opt.sidescrolloff = 36
			vim.g.codewindow = {
				auto_enable = true,
				exclude_filetypes = {
					"qf",
					"help",
				},
				minimap_width = 20,
				use_lsp = true,
				use_treesitter = true,
				use_git = true,
				width_multiplier = 4,
				z_index = 1,
				show_cursor = true,
				screen_bounds = "background",
				window_border = "none",
				-- window_border = { "", "", "", "", "", "", "", "" },
				relative = "win",
				events = {
					"LspAttach",
					"BufEnter",
					"BufNewFile",
					"BufRead",
					"TextChanged",
					"InsertLeave",
					"DiagnosticChanged",
					"FileWritePost",
				},
			}
		end,
		opts = {},
	},
}