local map = function(mode, lhs, rhs, opts)
    opts =
        vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

local border = 'rounded'

local make_capabilities = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.offsetEncoding = 'utf-16'
    return capabilities
end

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
-- 	opts = opts or {}
-- 	opts.border = opts.border or border
-- 	return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local set_keymap = function(_, bufnr)
    map(
        'n',
        '<leader>gD',
        vim.lsp.buf.declaration,
        { buffer = bufnr, desc = 'Go to declaration' }
    )
    map('n', '<leader>gt', function()
        require('telescope.builtin').lsp_type_definitions { jump_type = 'never' }
    end, { buffer = bufnr, desc = 'Go to type definition' })
    map('n', '<leader>gd', function()
        require('telescope.builtin').lsp_definitions { jump_type = 'never' }
    end, { buffer = bufnr, desc = 'Go to definition' })
    map('n', '<leader>gi', function()
        require('telescope.builtin').lsp_implementations { jump_type = 'never' }
    end, { buffer = bufnr, desc = 'Go to implementation' })
    map('n', '<leader>gr', function()
        require('telescope.builtin').lsp_references {
            include_declaration = false,
            include_current_line = false,
            jump_type = 'never',
        }
    end, { buffer = bufnr, desc = 'Go to references' })

    map('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Hover' })
    map(
        'n',
        '<Leader>wa',
        vim.lsp.buf.add_workspace_folder,
        { buffer = bufnr, desc = 'Add workspace ' }
    )
    map(
        'n',
        '<Leader>wr',
        vim.lsp.buf.remove_workspace_folder,
        { buffer = bufnr, desc = 'Remove workspace ' }
    )
    map('n', '<Leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { buffer = bufnr, desc = 'List workspace' })
    map('n', '<leader>ws', function()
        require('telescope.builtin').lsp_dynamic_workspace_symbols {
            jump_type = 'never',
        }
    end)
    map('n', '<leader>rn', function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
    end, {
        buffer = bufnr,
        expr = true,
        desc = 'Rename',
    })
    map(
        { 'n', 'x' },
        '<leader>ca',
        require('actions-preview').code_actions,
        { buffer = bufnr, desc = 'Code actions' }
    )
    map('n', '<leader>cf', function()
        vim.lsp.buf.format { async = true }
    end, { buffer = bufnr, desc = 'Code Format' })
    map('v', '<leader>cf', function()
        local start_row, _ = unpack(vim.api.nvim_buf_get_mark(0, '<'))
        local end_row, _ = unpack(vim.api.nvim_buf_get_mark(0, '>'))
        vim.lsp.buf.format {
            range = {
                ['start'] = { start_row, 0 },
                ['end'] = { end_row, 0 },
            },
            async = true,
        }
    end, { buffer = bufnr, desc = 'Code Format' })
end

local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local set_inlay_hint = function(client, bufnr)
    local inlay_hint = vim.lsp.inlay_hint
    if inlay_hint and client.supports_method 'textDocument/inlayHint' then
        inlay_hint.enable(true)
    end
end

local mason = {
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
        build = ':MasonUpdate',
        opts = {
            ensure_installed = {
                'stylua',
                'shfmt',
                -- "flake8",
            },
            ui = {
                border = border,
            },
        },
        config = function(_, opts)
            require('mason').setup(opts)
            local mr = require 'mason-registry'
            mr:on('package:install:success', function()
                vim.defer_fn(function()
                    require('lazy.core.handler.event').trigger {
                        event = 'FileType',
                        buf = vim.api.nvim_get_current_buf(),
                    }
                end, 100)
            end)
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    local p = mr.get_package(tool)
                    if not p:is_installed() then
                        p:install()
                    end
                end
            end
            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },
}

local Lspconfig = {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        vim.diagnostic.config {
            virtual_text = false,
            signs = {
                text = { ' ', ' ', ' ', ' ' },
            },
            underline = true,
            update_in_insert = true,
            severity_sort = true,
            float = {
                border = border,
                source = true,
            },
        }
        require('mason').setup()
        require('mason-lspconfig').setup()
        require('lspconfig.ui.windows').default_options.border = border

        require('lspconfig').bashls.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
        require('lspconfig').cssls.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
        require('lspconfig').dockerls.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
        require('lspconfig').html.setup {
            capabilities = make_capabilities(),
        }
        require('lspconfig').lua_ls.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
                -- client.server_capabilities.documentFormattingProvider = false
            end,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                    format = {
                        enable = false,
                        defaultConfig = {
                            indent_style = 'space',
                            indent_size = '2',
                            continuation_indent_size = '2',
                        },
                    },
                    hint = {
                        enable = true,
                        setType = true,
                    },
                },
            },
        }
        require('lspconfig').basedpyright.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
            settings = {
                basedpyright = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = 'openFilesOnly',
                        useLibraryCodeForTypes = true,
                    },
                },
            },
        }
        -- require("lspconfig").pylyzer.setup({
        --  capabilities = (function()
        --      local cap = make_capabilities()
        --      cap.offsetEncoding = { "utf-16" }
        --      return cap
        --  end)(),
        --  on_attach = function(client, bufnr)
        --      set_keymap(client, bufnr)
        --      -- set_inlay_hint(client, bufnr)
        --  end,
        --  settings = {
        --      python = {
        --          checkOnType = false,
        --          diagnostics = false,
        --          inlayHints = false,
        --          smartCompletion = false,
        --      },
        --  },
        -- })
        require('lspconfig').r_language_server.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
        require('lspconfig').sourcekit.setup {
            filetypes = { 'swift', 'objective-c' },
            single_file_support = true,
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
        require('lspconfig').sqlls.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
        require('lspconfig').vimls.setup {
            capabilities = make_capabilities(),
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
    end,
}
local rustaceanvim = {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
    init = function()
        vim.g.rustaceanvim = {
            tools = {},
            server = {
                on_attach = function(client, bufnr)
                    set_keymap(client, bufnr)
                    set_inlay_hint(client, bufnr)
                end,
                settings = {
                    ['rust-analyzer'] = {},
                },
            },
            dap = {},
        }
    end,
}

local jsonls = {
    'b0o/schemastore.nvim',
    ft = { 'json', 'jsonc' },
    config = function()
        require('lspconfig').jsonls.setup {
            capabilities = make_capabilities(),
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                },
            },
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
        }
    end,
}

local null_ls = {
    'nvimtools/none-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local null_ls = require 'null-ls'

        null_ls.setup {
            border = border,
            on_attach = function(client, bufnr)
                set_keymap(client, bufnr)
                set_inlay_hint(client, bufnr)
            end,
            sources = {
                null_ls.builtins.completion.spell,

                null_ls.builtins.diagnostics.checkmake,
                null_ls.builtins.diagnostics.hadolint,
                null_ls.builtins.diagnostics.gitlint,

                -- null_ls.builtins.diagnostics.pylint.with({
                --  args = {
                --      "--from-stdin",
                --      "$FILENAME",
                --      "-f",
                --      "json",
                --      "--errors-only",
                --  },
                -- }),
                null_ls.builtins.diagnostics.zsh,

                -- null_ls.builtins.formatting.autopep8,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.cmake_format,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.shellharden.with {
                    filetypes = {
                        'sh',
                        'bash',
                        'zsh',
                        'fish',
                    },
                },
                null_ls.builtins.formatting.typstyle,
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.yamlfmt,

                -- null_ls.builtins.hover.dictionary,
            },
        }
    end,
}

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        local root_dir =
            vim.fs.dirname(vim.fs.find({ '.ants' }, { upward = true })[1])
        if root_dir then
            local client = vim.lsp.start {
                name = 'ants-ls',
                cmd = { 'ants-ls' },
                root_dir = root_dir,
                on_attach = function(client, bufnr)
                    set_keymap(client, bufnr)
                end,
                capabilities = make_capabilities(),
                single_file_support = false,
            }
            if client then
                vim.lsp.buf_attach_client(0, client)
            end
        end
    end,
})

-- vim.lsp.start({
--  name = "ants-ls",
--  cmd = { "ants-ls" },
--  root_dir = vim.fs.dirname(vim.fs.find({ ".ants" }, { upward = true })[1]),
--  capabilities = make_capabilities(),
--  on_attach = function(client, bufnr)
--      set_keymap(client, bufnr)
--  end,
-- }, {})

return {
    mason,
    Lspconfig,
    rustaceanvim,
    null_ls,
    jsonls,
}
