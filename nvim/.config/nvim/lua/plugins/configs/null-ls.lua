local null_ls = require 'null-ls'
local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover

null_ls.setup {
  debug = true,
  sources = {
    require('null-ls').builtins.formatting.stylua.with { -- lua formatting
      settings = {
        indent_width = 8,
      },
    },
    null_ls.builtins.formatting.prettierd.with {
      prefer_local = '/usr/bin/prettierd',
      filetypes = { 'html', 'markdown', 'css', 'json', 'yaml', 'toml' },
      extra_filetypes = { 'toml' },
      extra_args = { '--no-semi', '--single-quote', '--print-width', '80' },
    },
    require('null-ls').builtins.formatting.prettier.with { -- markdown formatting
      extra_args = { '--print-width', '80' },
    },
    require('null-ls').builtins.formatting.shfmt, -- shell script formatting
    null_ls.builtins.diagnostics.markdownlint,
    -- null_ls.builtins.diagnostics.luacheck,
    formatting.gofumpt,
    diagnostics.pylint,
    code_actions.gitsigns,
    hover.dictionary,
  },
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
