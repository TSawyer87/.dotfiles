local o = vim.o

vim.g.mapleader = " "

o.laststatus = 3 -- global statusline
o.showmode = false
vim.wo.relativenumber = true

o.clipboard = "unnamedplus"

-- Indenting
o.expandtab = true  -- expand tab to spaces
o.shiftwidth = 2 -- 2 spaces for indent width
o.smartindent = true
o.autoindent = true -- copy indent from current line when starting a new one
o.tabstop = 2
o.softtabstop = 2
o.conceallevel = 2
o.colorcolumn = "80"

vim.opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.expandtab = true -- expand tab to spaces

-- Numbers
o.number = true

o.signcolumn = "yes" -- show sign column so that text doesn't shift
o.splitbelow = true  -- split horizontal window below
o.splitright = true -- split vertical window right
o.termguicolors = true
o.background = "dark"
o.timeoutlen = 400
o.undofile = true

o.grepprg = 'rg --vimgrep --follow'
-- turn off swapfile
o.swapfile = false

-- Gui settings
o.guifont = "Source Code Pro:h16"
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_curl = 1.0
