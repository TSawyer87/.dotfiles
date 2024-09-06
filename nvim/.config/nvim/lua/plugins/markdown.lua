return {
    {
        "MeanderingProgrammer/markdown.nvim",
        name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
        ft = "markdown",
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- Mandatory
            "nvim-tree/nvim-web-devicons", -- Optional but recommended
        },
        config = function()
            require("render-markdown").setup {}
        end,
    },

    {
        "tadmccorkle/markdown.nvim",
        ft = "markdown", -- or 'event = "VeryLazy"'
        opts = {
            on_attach = function(bufnr)
                local function toggle(key)
                    return "<Esc>gv<Cmd>lua require'markdown.inline'" .. ".toggle_emphasis_visual'" .. key .. "'<CR>"
                end

                vim.keymap.set("x", "<C-b>", toggle "b", { buffer = bufnr })
                vim.keymap.set("x", "<C-i>", toggle "i", { buffer = bufnr })
            end,
        },
    },
    {
        "Kicamon/markdown-table-mode.nvim",
        ft = { "markdown" },
        config = function()
            require("markdown-table-mode").setup()
        end,
    },

    { "ellisonleao/glow.nvim", ft = "markdown", config = true, cmd = "Glow" },
    {

        "dhananjaylatkar/notes.nvim",
        cmd = { "NotesNew", "NotesFind", "NotesGrep" },
        dependencies = { "nvim-telescope/telescope.nvim" },
        opts = {
            root = vim.fn.expand "$HOME/notes/",
        },
    },
    -- {
    --       "zk-org/zk-nvim",
    --       config = function()
    --             require("zk").setup {
    --                   picker = "telescope",
    --                   lsp = {
    --                         -- `config` is passed to `vim.lsp.start_client(config)`
    --                         config = {
    --                               cmd = { "zk", "lsp" },
    --                               name = "zk",
    --                               -- on_attach = ...
    --                               -- etc, see `:h vim.lsp.start_client()`
    --                         },
    --
    --                         -- automatically attach buffers in a zk notebook that match the given filetypes
    --                         auto_attach = {
    --                               enabled = true,
    --                               filetypes = { "markdown" },
    --                         },
    --                   },
    --                   -- See Setup section below
    --             }
    --       end,
    -- },
    {
        "jakewvincent/mkdnflow.nvim",
        config = function()
            require("mkdnflow").setup {
                -- Config goes here; leave blank for defaults
            }
        end,
    },
}
