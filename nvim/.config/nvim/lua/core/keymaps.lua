vim.g.mapleader = ' '
local map = vim.keymap.set

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

map('n', '<Esc>', '<cmd>nohlsearch<CR>') -- clear search highlights


-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- better up/down
map(
    { 'n', 'x' },
    'j',
    "v:count == 0 ? 'gj' : 'j'",
    { desc = 'Down', expr = true, silent = true }
)
map(
    { 'n', 'x' },
    '<Down>',
    "v:count == 0 ? 'gj' : 'j'",
    { desc = 'Down', expr = true, silent = true }
)
map(
    { 'n', 'x' },
    'k',
    "v:count == 0 ? 'gk' : 'k'",
    { desc = 'Up', expr = true, silent = true }
)
map(
    { 'n', 'x' },
    '<Up>',
    "v:count == 0 ? 'gk' : 'k'",
    { desc = 'Up', expr = true, silent = true }
)

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- cmd mode
map('n', ';', ':', { desc = 'CMD enter command mode' })
-- escape with jk
map('i', 'jk', '<ESC>')
-- save with <C-s>
map({ 'n', 'i', 'v' }, '<C-s>', '<cmd> w <cr>')
--keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- commenting
map(
    'n',
    'gco',
    'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>',
    { desc = 'Add Comment Below' }
)
map(
    'n',
    'gcO',
    'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>',
    { desc = 'Add Comment Above' }
)

-- lazy
map('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy' })

-- new file
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

map('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
map('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })
-- copy to clipboard
map({ 'n', 'x' }, 'cp', '"+y')
-- paste from clipboard
map({ 'n', 'x' }, 'cv', '"+p')

-- Delete without changing the registers
map({ 'n', 'x' }, 'x', '"_x')

-- Move selected lines
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- Set highlight on search, but clear on pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map(
    'n',
    '<leader>ur',
    '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>',
    { desc = 'Redraw / Clear hlsearch / Diff Update' }
)

-- buffers -------------------------------------------------------------------------------------------------------------
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = 'Close Other Tabs' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- swapping buffers between windows
map('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
map('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
map('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
map('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
-- windows
map('n', '<leader>ww', '<C-W>p', { desc = 'Other Window', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>+', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wm', function()
    require('smart-splits').toggle.maximize()
end, { desc = 'Maximize Toggle' })

-- Resize splits
map('n', '<A-h>', require('smart-splits').resize_left)
map('n', '<A-j>', require('smart-splits').resize_down)
map('n', '<A-k>', require('smart-splits').resize_up)
map('n', '<A-l>', require('smart-splits').resize_right)
-- highlights under cursor
map('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
map('n', '<leader>uI', '<cmd>InspectTree<cr>', { desc = 'Inspect Tree' })

-- Terminal Mappings --------------------------------------------------------------------------------------------------
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Enter Normal Mode' })
map('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Go to Left Window' })
map('t', '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Go to Lower Window' })
map('t', '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Go to Upper Window' })
map('t', '<C-l>', '<cmd>wincmd l<cr>', { desc = 'Go to Right Window' })
map('t', '<C-/>', '<cmd>close<cr>', { desc = 'Hide Terminal' })
map('t', '<c-_>', '<cmd>close<cr>', { desc = 'which_key_ignore' })



-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
map('n', 'zR', require('ufo').openAllFolds)
map('n', 'zM', require('ufo').closeAllFolds)

local map = function(mode, lhs, rhs, opts)
    opts =
        vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

local default_options = { noremap = true, silent = true }
local expr_options = { expr = true, silent = true }

map({ 'n', 'x' }, '<Space>', '<Nop>')
map({ 'n', 'x', 'i', 'c', 't' }, '<f1>', '<nop>')
map({ 'n', 'x', 'i', 'c' }, '<c-z>', '<nop>')
vim.g.mapleader = ' '

map(
    'n',
    'gO',
    "<cmd>call append(line('.') -1, repeat([''], v:count1))<cr>",
    { desc = 'append line before' }
)
map(
    'n',
    'go',
    "<cmd>call append(line('.'),   repeat([''], v:count1))<cr>",
    { desc = 'append line after' }
)

map({ 'n', 'v' }, 'k', "v:count == 0 ? 'gk' : 'k'", expr_options)
map({ 'n', 'v' }, 'j', "v:count == 0 ? 'gj' : 'j'", expr_options)

map('x', 'g/', '<esc>/\\%V', {
    silent = false,
    desc = 'Search inside visual selection',
})
map('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"', {
    expr = true,
    replace_keycodes = false,
    desc = 'Visually select changed text',
})

-- map("n", "<leader>o", "<C-o>", default_options)
-- map("n", "<leader>i", "<C-i>", default_options)

map('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
map('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
map('n', '<leader>wc', '<C-w>c', { desc = 'Close window' })
map('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
-- map("n", "<leader>ws", "<C-w>s", default_options)
-- map("n", "<leader>wc", "<C-w>c", default_options)
-- map("n", "<leader>wo", "<C-w>o", default_options)
map('t', '<esc>', [[<C-\><C-n>]], default_options)
-- map("n", "<C-,>", "<C-w><", default_options)
-- map("n", "<C-.>", "<C-w>>", default_options)
-- map("n", "<C-=>", "<C-w>+", default_options)
-- map("n", "<C-->", "<C-w>-", default_options)

map('n', '<esc>', ':nohlsearch<cr>', default_options)

map({ 'i', 'c', 't' }, '<M-h>', '<Left>', { noremap = false, desc = 'Left' })
map({ 'i', 'c', 't' }, '<M-j>', '<Down>', { noremap = false, desc = 'Down' })
map({ 'i', 'c', 't' }, '<M-k>', '<Up>', { noremap = false, desc = 'Up' })
map({ 'i', 'c', 't' }, '<M-l>', '<Right>', { noremap = false, desc = 'Right' })

map(
    'n',
    '<leader>qd',
    vim.diagnostic.setqflist,
    { desc = 'Quickfix diagnostics' }
)
map(
    'n',
    '<leader>ld',
    vim.diagnostic.setloclist,
    { desc = 'Local diagnostics' }
)
map(
    'n',
    '<leader>cd',
    vim.diagnostic.open_float,
    { desc = 'Current line diagnostics' }
)

map('x', '.', ':norm .<CR>')
map('x', '@', ':norm @q<CR>')

map(
    'n',
    '<leader>yr',
    ":call setreg('+', getreg('@'))<CR>",
    { desc = 'Paste register to system clipboard' }
)
map(
    'n',
    '<leader>yp',
    ":call setreg('+', expand('%:.') .. ':' .. line('.'))<CR>",
    { desc = 'Paste filename and line number to system clipboard' }
)

vim.cmd [[
cnoreabbrev W! w!
cnoreabbrev W1 w!
cnoreabbrev w1 w!
cnoreabbrev Q! q!
cnoreabbrev Q1 q!
cnoreabbrev q1 q!
cnoreabbrev Qa! qa!
cnoreabbrev Qall! qall!
cnoreabbrev Wa wa
cnoreabbrev Wq wq
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev wq1 wq!
cnoreabbrev Wq1 wq!
cnoreabbrev wQ1 wq!
cnoreabbrev WQ1 wq!
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
]]
-- Yanky
-- map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
-- map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
-- map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
-- map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
--
-- map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- map("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- -- keymaps for `tpope/vim-unimpared`
-- map("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
-- map("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
-- map("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
-- map("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
--
-- map("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
-- map("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
-- map("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
-- map("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
--
-- map("n", "=p", "<Plug>(YankyPutAfterFilter)")
-- map("n", "=P", "<Plug>(YankyPutBeforeFilter)")
--
-- map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
-- map("n", "<c-n>", "<Plug>(YankyNextEntry)")
-- vim: ts=2 sts=2 sw=2 et
