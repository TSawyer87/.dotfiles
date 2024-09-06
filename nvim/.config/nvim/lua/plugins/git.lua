return {
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
        config = function()
            require("telescope").load_extension "lazygit"
        end,
    },
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        cmd = {
            "GitConflictChooseOurs",
            "GitConflictChooseTheirs",
            "GitConflictChooseBoth",
            "GitConflictChooseNone",
            "GitConflictNextConflict",
            "GitConflictPrevConflict",
            "GitConflictListQf",
        },
        keys = {
            {
                "<leader>ko",
                "<Plug>(git-conflict-ours)",
                desc = "Choose our version",
            },
            {
                "<leader>kt",
                "<Plug>(git-conflict-theirs)",
                desc = "Choose their version",
            },
            {
                "<leader>kb",
                "<Plug>(git-conflict-both)",
                desc = "Choose both versions",
            },
            {
                "<leader>kn",
                "<Plug>(git-conflict-none)",
                desc = "Choose no version",
            },
            -- {
            -- 	"[x",
            -- 	"<Plug>(git-conflict-prev-conflict)",
            -- 	desc = "Previous conflict",
            -- },
            -- {
            -- 	"]x",
            -- 	"<Plug>(git-conflict-next-conflict)",
            -- 	desc = "Next conflict",
            -- },
        },
        opts = {
            default_mappings = false,
            default_commands = true,
            disable_diagnostics = true,
        },
    },
    {

        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
            "DiffviewFileHistory",
        },
        opts = {},
    },
    {
        "NeogitOrg/neogit",
        cmd = {
            "Neogit",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            graph_style = "unicode",
            integrations = {
                telescope = true,
                diffview = true,
                fzf_lua = nil,
            },
        },
    },
    {
        "moyiz/git-dev.nvim",
        cmd = { "GitDevOpen" },
        keys = {
            {
                "<leader>go",
                function()
                    local repo = vim.fn.input "Repository name / URI: "
                    if repo ~= "" then
                        require("git-dev").open(repo)
                    end
                end,
                desc = "[O]pen a remote git repository",
            },
        },
        opts = {
            cd_type = "tab",
        },
    },
    {
        "ejrichards/baredot.nvim",
        event = "VeryLazy",
        enabled = true,
        opts = {
            git_dir = "~/.cfg",
        },
    },
}
