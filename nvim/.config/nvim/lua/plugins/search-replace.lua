return {
    {
        "roobert/search-replace.nvim",
        cmd = {
            "SearchReplaceSingleBufferOpen",
            "SearchReplaceMultiBufferOpen",

            "SearchReplaceSingleBufferCWord",
            "SearchReplaceSingleBufferCWORD",
            "SearchReplaceSingleBufferCExpr",
            "SearchReplaceSingleBufferCFile",

            "SearchReplaceMultiBufferCWord",
            "SearchReplaceMultiBufferCWORD",
            "SearchReplaceMultiBufferCExpr",
            "SearchReplaceMultiBufferCFile",

            "SearchReplaceSingleBufferSelections",
            "SearchReplaceMultiBufferSelections",

            "SearchReplaceSingleBufferWithinBlock",

            "SearchReplaceVisualSelection",
            "SearchReplaceVisualSelectionCWord",
            "SearchReplaceVisualSelectionCWORD",
            "SearchReplaceVisualSelectionCExpr",
            "SearchReplaceVisualSelectionCFile",
        },
        keys = {
            { "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>" },
            { "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>" },
            { "<leader>rw", "<CMD>SearchReplaceSingleBufferCWord<CR>" },
            { "<leader>re", "<CMD>SearchReplaceSingleBufferCExpr<CR>" },
            { "<leader>rf", "<CMD>SearchReplaceSingleBufferFile<CR>" },

            { "<leader>rbs", "<CMD>SearchReplaceMultiBufferSelections<CR>" },
            { "<leader>rbo", "<CMD>SearchReplaceMultiBufferOpen<CR>" },
            { "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWord<CR>" },
            { "<leader>rbw", "<CMD>SearchReplaceMultiBufferCWORD<CR>" },
            { "<leader>rbe", "<CMD>SearchReplaceMultiBufferCExpr<CR>" },
            { "<leader>rbf", "<CMD>SearchReplaceMultiBufferCFile<CR>" },

            { "<C-r>", [[<CMD>SearchReplaceSingleBufferVisualSelection<CR>]], mode = "v" },
            { "<C-b>", [[<CMD>SearchReplaceWithinVisualSelectionCWord<CR>]], mode = "v" },
        },
        opts = {
            default_replace_single_buffer_options = "gcI",
            default_replace_multi_buffer_options = "egcI",
        },
    },
    {
        "chrisgrieser/nvim-rip-substitute",
        init = function()
            vim.api.nvim_create_user_command("RipSub", function()
                require("rip-substitute").sub()
            end, {
                desc = " rip substitute",
            })
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        cmd = "Refactor",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require "plugins.configs.refactoring"
        end,
    },
    {
        "MagicDuck/grug-far.nvim",
        opts = { headerMaxWidth = 80 },
        cmd = "GrugFar",
        keys = {
            {
                "<leader>fr",
                function()
                    local grug = require "grug-far"
                    local ext = vim.bo.buftype == "" and vim.fn.expand "%:e"
                    grug.grug_far {
                        transient = true,
                        prefills = {
                            filesFilter = ext and ext ~= "" and "*." .. ext or nil,
                        },
                    }
                end,
                mode = { "n", "v" },
                desc = "Find and Replace",
            },
        },
    },
}
