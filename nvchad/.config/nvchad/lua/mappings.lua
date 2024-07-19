require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- cmd mode
map("n", ";", ":", { desc = "CMD enter command mode" })
-- escape with jk
map("i", "jk", "<ESC>")
-- save with <C-s>
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
map("n", "<Esc>", '<cmd>nohlsearch<CR>')

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

for i = 1, 9, 1 do
  map("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end


-- wezterm-tmux
local mux = require("wezterm-mux")
map("n", "<C-h>", mux.wezterm_move_left)
map("n", "<C-l>", mux.wezterm_move_right)
map("n", "<C-j>", mux.wezterm_move_down)
map("n", "<C-k>", mux.wezterm_move_up)
map("n", "<A-x>", "<C-w>q") -- some actions dont need from a specific function


