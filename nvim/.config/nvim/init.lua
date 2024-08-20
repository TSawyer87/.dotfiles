vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
require("core.lazy") -- Bootstrap lazy.nvim
require("core.keymaps") -- Setup keymaps
require("core.options") -- Setup options
require("core.autocmds") -- Setup autocommands

-- The line beneath this is called 'modeline'. See ':help modeline'
--vim: ts=2 sts=2 sw=2 et
