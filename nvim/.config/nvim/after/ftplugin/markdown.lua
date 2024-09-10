-- markdown configs
local opts = { silent = true, remap = false }
vim.keymap.set("n", "<leader>toc", [[<Cmd>0read !gh-md-toc %<CR>]], opts) -- add Table of Contents in md files
vim.keymap.set("n", "<leader>m", [[<Cmd>Glow<CR>]], opts) -- open markdown preview
vim.opt_local.shiftwidth = 2
vim.opt_local.expandtab = true
-- If you have an init.lua
vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
-- Use the following if your buffer is set to become hidden
--vim.api.nvim_create_autocmd("BufLeave", {pattern = "*.md", command = "silent! wall"})
