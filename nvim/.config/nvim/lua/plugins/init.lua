return {
	"tpope/vim-fugitive", -- Git commands in nvim
	"tpope/vim-rhubarb", -- Fugitive-companion to interact with github
	"numToStr/Comment.nvim", -- "gc" to comment visual regions/lines
	"linrongbin16/lsp-progress.nvim", -- LSP progress
	"nvim-tree/nvim-web-devicons",
	-- "nvim-lualine/lualine.nvim", -- Fancier statusline
	"kdheepak/lazygit.nvim",
	"kevinhwang91/promise-async",
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		config = function() end,
	},
	{
		"goolord/alpha-nvim",
		lazy = false,
		config = function() end,
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		config = function() end,
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"smoka7/hop.nvim",
		version = "*",
		event = "VimEnter",
		config = function() end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "BufEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = function()
			require("ibl").setup()
		end,
	},
	-- {
	-- 	"VonHeikemen/lsp-zero.nvim",
	-- 	event = "VimEnter",
	-- 	branch = "v3.x",
	-- 	config = function() end,
	-- 	dependencies = {
	-- 		{ "neovim/nvim-lspconfig" },
	-- 		{ "williamboman/mason.nvim" },
	-- 		{ "williamboman/mason-lspconfig.nvim" },
	-- 	},
	-- },
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "VeryLazy",
		config = function() end,
	},
	-- {
	-- 	"Shatur/neovim-session-manager",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 	end,
	-- },
	{
		"folke/noice.nvim",
		event = "VimEnter",
		config = function() end,
		dependencies = { { "MunifTanjim/nui.nvim" } },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		vscode = true,
		---@type Flash.Config
		opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	-- {
	-- 	"nvimtools/none-ls.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	config = function() end,
	-- 	dependencies = {
	-- 		{
	-- 			"jay-babu/mason-null-ls.nvim",
	-- 			cmd = { "NullLsInstall", "NullLsUninstall" },
	-- 			config = function() end,
	-- 		},
	-- 	},
	-- },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function() end,
		dependencies = {
			{ "onsails/lspkind.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{ "NvChad/nvim-colorizer.lua", event = "VimEnter" },
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function() end,
		dependencies = {
			{
				"jay-babu/mason-nvim-dap.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				config = function() end,
			},
			{
				"rcarriga/nvim-dap-ui",
				config = function() end,
			},
			{
				"theHamsta/nvim-dap-virtual-text",
				config = function() end,
			},
			{
				"nvim-neotest/nvim-nio",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function() end,
	},
	{ "HiPhish/rainbow-delimiters.nvim" },
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = "kevinhwang91/promise-async",
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"cappyzawa/trim.nvim",
		event = "VeryLazy",
		config = function() end,
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		-- Optional dependency
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function() end,
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"ahmedkhalf/project.nvim",
		event = "VimEnter",
		config = function() end,
	},
	{
		"tiagovla/scope.nvim",
		event = "VimEnter",
		config = function() end,
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function() end,
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function() end,
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		cmd = { "TroubleToggle", "Trouble" },
	},
	{
		"folke/twilight.nvim",
		event = "VeryLazy",
		cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
		config = function() end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			require("which-key").setup()
		end,
	},
	{
		"windwp/windline.nvim",
		event = "VeryLazy",
		config = function()
			require("wlsample.evil_line")
		end,
	},
	{
		"stevearc/oil.nvim",
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		config = function() end,
	},
	-- GoLang
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
}
