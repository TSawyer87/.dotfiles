local null_ls = require("null-ls")

local exist, user_config = pcall(require, "user.user_config")
local sources = exist
		and type(user_config) == "table"
		and user_config.setup_sources
		and user_config.setup_sources(null_ls.builtins)
	or {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.markdownlint,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prettierd.with({
			filetypes = { "markdown", "yaml", "python" },
		}),
	}

null_ls.setup({
	sources = sources,
})
