return {

  {
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    ft = 'markdown',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- Mandatory
      'nvim-tree/nvim-web-devicons', -- Optional but recommended
    },
    config = function()
      require('render-markdown').setup {}
    end,
  },
   {
    'tadmccorkle/markdown.nvim',
    ft = 'markdown', -- or 'event = "VeryLazy"'
    opts = {
      on_attach = function(bufnr)
        local function toggle(key)
          return "<Esc>gv<Cmd>lua require'markdown.inline'" .. ".toggle_emphasis_visual'" .. key .. "'<CR>"
        end

        vim.keymap.set('x', '<C-b>', toggle 'b', { buffer = bufnr })
        vim.keymap.set('x', '<C-i>', toggle 'i', { buffer = bufnr })
      end,
    },
  },
  {
    'kevinhwang91/nvim-ufo',
    event = 'VeryLazy',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require 'plugins.configs.ufo'
    end,
  },
  { 'ellisonleao/glow.nvim', ft = 'markdown', config = true, cmd = 'Glow' },
}
-- vim: ts=2 sts=2 sw=2 et

