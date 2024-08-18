local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({
  ui = { border = "rounded" },
  registries = {
    "github:mason-org/mason-registry",
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "black",
    "ruff",
    "prettier",
    "prettierd",
    "shfmt",
    "checkstyle",
    "stylua",
    "jq",
    "yamlfmt",
  },
})
require('lspconfig').ruff.setup({
  init_options = {
    settings = {
      -- Server settings should go here
    }
  }
})

local on_attach = function(client, bufnr)
  if client.name == 'ruff_lsp' then
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end
end

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
}

require('lspconfig').pyright.setup {
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { '*' },
      },
    },
  },
}
require'lspconfig'.markdown_oxide.setup{}
require'lspconfig'.marksman.setup{}
require'lspconfig'.bashls.setup{}
lsp_capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local mason_lspconfig = require("mason-lspconfig")
local border = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}
local handlers = {
  vim.diagnostic.config({
    float = { border = "rounded" },
    -- virtual_text = false,
  }),
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = border }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = border }
  ),
}

local function on_attach(client, bufnr)
  if vim.g.extra_lsp_actions ~= nil then
    vim.g.extra_lsp_actions()
  end
end

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "basedpyright",
    "ruff",
    "ruff_lsp",

  },
})
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      handlers = handlers,
    })
  end,
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        Lua = {
          hint = {
            enable = true,
          },
        },
      },
    })
  end,
["marksman"] = function()
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        Markdown = {
          hint = {
            enable = true,
          },
        },
      },
    })
  end,
  ["basedpyright"] = function()
    lspconfig["basedpyright"].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        basedpyright = {
          typeCheckingMode = "off",
        },
        python = {
          analysis = {
            diagnosticSeverityOverrides = {
              reportUnusedExpression = "none",
            },
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
          },
        },
      },
    })
  end,
  ["gopls"] = function()
    lspconfig.gopls.setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      handlers = handlers,
      settings = {
        gopls = {
          hints = {
            rangeVariableTypes = true,
            parameterNames = true,
            constantValues = true,
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            functionTypeParameters = true,
          },
        },
      },
    })
  end,
})
require("lsp-zero").setup({
  on_attach = on_attach,
  capabilities = lsp_capabilities,
  handlers = handlers,
})
