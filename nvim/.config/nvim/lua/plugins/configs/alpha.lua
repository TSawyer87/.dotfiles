local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  -- "                                                     ",
  --     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  --     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  --     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  --     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  --     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  --     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  --     "                                                     ",
  --     [[                               __                ]],
	-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        [[  ███       ███  ]],
  		  [[  ████      ████ ]],
  		  [[  ████     █████ ]],
  		  [[ █ ████    █████ ]],
  		  [[ ██ ████   █████ ]],
  		  [[ ███ ████  █████ ]],
  		  [[ ████ ████ ████ ]],
  		  [[ █████  ████████ ]],
  		  [[ █████   ███████ ]],
  		  [[ █████    ██████ ]],
  		  [[ █████     █████ ]],
  		  [[ ████      ████ ]],
  		  [[  ███       ███  ]],
  		  [[                    ]],
  		  [[  N  E  O  V  I  M  ]],

}
dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Restore session", ":SessionRestore<CR>"),
	dashboard.button("m", "󰱼  Word Finder", ":Telescope live_grep<CR>"),
	dashboard.button("l", "  Marks", ":Telescope marks<CR>"),
	dashboard.button("q", "󰩈  Quit Nvim", ":qa<CR>"),
}
local handle = io.popen("fortune")
local fortune = handle:read("*a")
handle:close()
dashboard.section.footer.val = fortune

dashboard.config.opts.noautocmd = true

vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.config)