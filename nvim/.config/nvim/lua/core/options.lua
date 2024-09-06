-- [[ Setting options ]]
local opt = vim.opt
local o = vim.o
local g = vim.g
-- Make line numbers default
o.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
o.mouse = "a"

-- Don't show the mode, since it's already in the status line
o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    o.clipboard = "unnamedplus"
end)

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Keep signcolumn on by default
o.signcolumn = "yes"

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 300

-- Configure how new splits should be opened
o.splitright = true
o.splitbelow = true
-- Folding
o.smoothscroll = true
o.conceallevel = 2
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldtext = ""
o.wrap = true
-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

opt.fillchars = { eob = " " }
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"
o.termguicolors = true
o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
o.autochdir = true
o.timeoutlen = 400
o.undofile = true
o.undolevels = 10000
o.undoreload = 10000

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
o.inccommand = "split"

-- Show which line your cursor is on
o.cursorline = true
o.cursorcolumn = true
o.colorcolumn = "80"
o.completeopt = "menu,menuone,noselect"

-- Show the line and column number of the cursor position
o.ruler = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10
---Neovide options
-- g.neovide_input_macos_option_key_is_meta = "both"
o.guifont = "Source Code Pro:h14"

g.neovide_underline_stroke_scale = 3
g.neovide_floating_shadow = false
g.neovide_transparency = 1
g.neovide_window_blurred = true
g.neovide_floating_blur_amount_x = 2.0
g.neovide_floating_blur_amount_y = 2.0
g.neovide_show_border = true
g.neovide_touch_deadzone = 6.0
g.neovide_cursor_animate_command_line = false
g.neovide_cursor_smooth_blink = true

g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
opt.whichwrap:append "<>[]hl"
o.virtualedit = "block" -- can move cursor where there is no physical line
o.grepformat = "%f:%l:%c:%m" -- for :grep
o.grepprg = "rg --hidden --vimgrep --smart-case --" -- for :grep
o.inccommand = "nosplit" -- live substitution
o.jumpoptions = "view" -- for gk and gj
o.linebreak = true -- lines wrap and continue on next line
o.list = true -- show some invisible characters (tabs...)
o.sidescroll = 8 -- minimal number of columns to scroll horizontally
o.wildmode = "longest:full,full" -- get bash-like tab completions
o.winminwidth = 5 -- minimum width for window

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH
-- vim: ts=2 sts=2 sw=2 et
