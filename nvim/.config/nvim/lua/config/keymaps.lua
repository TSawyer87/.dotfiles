-- [[ Basic Keymaps ]]
-- require 'keymaps'
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
vim.keymap.set("n", "J", ":m .+1<CR>==")
vim.keymap.set("n", "K", ":m .-2<CR>==")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Image Pasting
vim.keymap.set("n", "<leader>p", "<CMD>PasteImage<CR>", { desc = "Paste clipboard image" })

-- Trouble
vim.keymap.set("n", "<leader>tr", "<CMD>TroubleToggle lsp_references<CR>", { desc = "LSP References" })
vim.keymap.set("n", "<leader>td", "<CMD>TroubleToggle lsp_definitions<CR>", { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>cd", "<CMD>TroubleToggle<CR>", { desc = "LSP Diagnostics" })

-- Ufo
vim.keymap.set("n", "zR", "<CMD>lua require('ufo).openAllFolds()<CR>", { desc = "Open all folds" })
vim.keymap.set("n", "zM", "<CMD>lua require('ufo).closeAllFolds()<CR>", { desc = "Close all folds" })

-- ZenMode
-- vim.keymap.set("n", "<leader>zm", require("zen-mode").toggle, { desc = "Toggle ZenMode" })

-- Aerial
vim.keymap.set("n", "<leader>at", "<CMD>AerialToggle<CR>", { desc = "Toggle Aerial" })

-- Notify
vim.keymap.set("n", "<ESC>", "<CMD>lua require('notify').dismiss()<CR>", { desc = "Dismiss notification" })
vim.keymap.set("i", "<ESC>", "<CMD>lua require('notify').dismiss()<CR><ESC>", { desc = "Dismiss notification" })

-- Session
vim.keymap.set("n", "<leader>ss", "<CMD>SessionManager save_current_session<CR>", { desc = "Save Session" })
vim.keymap.set("n", "<leader>o", "<CMD>SessionManager load_session<CR>", { desc = "Save Session" })

-- hop
vim.keymap.set("n", "<leader>j", "<CMD>HopWord<CR>", { desc = "Hop Word" })

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other Window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
vim.keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>+", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wm", function()
	require("smart-splits").toggle.maximize()
end, { desc = "Maximize Toggle" })

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- [[Terminal Options]]
local set = vim.opt_local

-- Setting local options for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom_term_open", {}),
	callback = function()
		set.number = false
		set.relativenumber = false
		set.scrolloff = 0
	end,
})

-- Indentation Keymaps
vim.keymap.set("v", "<", "<gv", { desc = "Indent line left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent line left" })

-- Terminal Keymaps
vim.keymap.set("n", "<leader>tj", function()
	vim.cmd.new()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 14)
	vim.wo.winfixheight = true
	vim.cmd.term()
end, { desc = "Open terminal below" })

vim.keymap.set("n", "<leader>tk", function()
	vim.cmd.new()
	vim.cmd.wincmd("K")
	vim.api.nvim_win_set_height(0, 14)
	vim.wo.winfixheight = true
	vim.cmd.term()
end, { desc = "Open terminal above" })
