return {
  'nvim-telescope/telescope.nvim',
  lazy = true,
  cmd = { 'Telescope', 'Easypick' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'junegunn/fzf.vim',
    'echasnovski/mini.icons',
    'debugloop/telescope-undo.nvim',
    'rcarriga/nvim-notify',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'axkirillov/easypick.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },
    {
      'agoodshort/telescope-git-submodules.nvim',
      dependencies = 'akinsho/toggleterm.nvim',
    },
  },
  config = function()
    require 'plugins.configs.telescope'
  end,
}
