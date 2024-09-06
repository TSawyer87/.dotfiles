return {
  {
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		event = "VeryLazy",
		config = function()
			require("plugins.configs.ufo")
		end,
	},
	{
		"echasnovski/mini.pairs",
		event = { "InsertEnter" },
		config = true,
		opts = {
			mappings = {
				-- Prevents the action if the cursor is just before any character or next to a "\".
				["("] = { action = "open", pair = "()", neigh_pattern = "[^\\][%s%)%]%}]" },
				["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\][%s%)%]%}]" },
				["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\][%s%)%]%}]" },
				-- This is default (prevents the action if the cursor is just next to a "\").
				[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
				-- Prevents the action if the cursor is just before or next to any character.
				['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w][^%w]", register = { cr = false } },
				["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
				["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^%w][^%w]", register = { cr = false } },
			},
		},
	},
}
