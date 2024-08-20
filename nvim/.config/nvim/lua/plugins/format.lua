return {
  {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'plugins.configs.null-ls'
    end,
    dependencies = {
      {
        'jay-babu/mason-null-ls.nvim',
        cmd = { 'NullLsInstall', 'NullLsUninstall' },
        opts = {
          ensure_installed = nil,
          automatic_installation = true,
          automatic_setup = false,
        },
        config = function()
          require 'plugins.configs.mason-null-ls'
        end,
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

