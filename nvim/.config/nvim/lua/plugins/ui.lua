return {
    -- Notify
    { "echasnovski/mini.notify", version = false },

    -- This is what powers LazyVim's fancy-looking
    -- tabs, which include filetype icons and close buttons.
    {
        "akinsho/bufferline.nvim",
        enabled = true,
        lazy = false,
        config = function()
            require("plugins.configs.bufferline")
        end,
    },
    -- statusline

    -- indent guides for Neovim
    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        event = { "BufReadPre", "BufNewFile" },
        main = "ibl",
        opts = {},
    },
    -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
        },
    -- stylua: ignore
    keys = {
      { "<leader>sn", "", desc = "+noice"},
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<leader>snt", function() require("noice").cmd("pick") end, desc = "Noice Picker (Telescope/FzfLua)" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
        config = function(_, opts)
            -- HACK: noice shows messages from before it was enabled,
            -- but this is not ideal when Lazy is installing plugins,
            -- so clear the messages in this case.
            if vim.o.filetype == "lazy" then
                vim.cmd([[messages clear]])
            end
            require("noice").setup(opts)
        end,
    },

    -- icons
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },

    -- ui components
    { "MunifTanjim/nui.nvim", lazy = true },

    {
        "nvimdev/dashboard-nvim",
        lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
        opts = function()
            local logo = [[
             ██╗   ██╗██╗███╗   ███╗          Z
             ██║   ██║██║████╗ ████║      Z    
             ██║   ██║██║██╔████╔██║   z       
             ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
              ╚████╔╝ ██║██║ ╚═╝ ██║           
               ╚═══╝  ╚═╝╚═╝     ╚═╝           
        ]]

            logo = string.rep("\n", 8) .. logo .. "\n\n"

            local opts = {
                theme = "doom",
                hide = {
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    center = {
                        {
                            action = "Telescope find_files",
                            desc = " Find File",
                            icon = " ",
                            key = "f",
                        },
                        {
                            action = "ene | startinsert",
                            desc = " New File",
                            icon = " ",
                            key = "n",
                        },
                        {
                            action = "Telescope oldfiles",
                            desc = " Recent Files",
                            icon = " ",
                            key = "r",
                        },
                        {
                            action = "Telescope live_grep",
                            desc = " Find Text",
                            icon = " ",
                            key = "g",
                        },
                        {
                            action = "Telescope find_files cwd=~/.config/nvim",
                            desc = " Config",
                            icon = " ",
                            key = "c",
                        },
                        {
                            action = 'lua require("persistence").load()',
                            desc = " Restore Session",
                            icon = " ",
                            key = "s",
                        },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        {
                            action = function()
                                vim.api.nvim_input("<cmd>qa<cr>")
                            end,
                            desc = " Quit",
                            icon = " ",
                            key = "q",
                        },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return {
                            "⚡ Neovim loaded "
                                .. stats.loaded
                                .. "/"
                                .. stats.count
                                .. " plugins in "
                                .. ms
                                .. "ms",
                        }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            if vim.o.filetype == "lazy" then
                vim.api.nvim_create_autocmd("WinClosed", {
                    pattern = tostring(vim.api.nvim_get_current_win()),
                    once = true,
                    callback = function()
                        vim.schedule(function()
                            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                        end)
                    end,
                })
            end

            return opts
        end,
    },
    {
        "luukvbaal/statuscol.nvim",
        event = { "BufReadPre", "BufNewFile" },
        branch = "0.10",
        enabled = true,
        init = function()
            vim.opt.number = true
            vim.opt.relativenumber = true
        end,
        opts = function()
            local builtin = require("statuscol.builtin")
            return {
                setopt = true,
                relculright = true,
                ft_ignore = {
                    "aerial",
                    "neo-tree",
                    "undotree",
                },
                bt_ignore = {
                    "terminal",
                },
                segments = {
                    {
                        sign = {
                            namespace = { ".*" },
                            name = { ".*" },
                        },
                        condition = { is_not_neominimap },
                    },
                    {
                        text = {
                            builtin.lnumfunc,
                            " ",
                            builtin.foldfunc,
                        },
                        condition = { is_not_neominimap },
                    },
                    {
                        sign = {
                            namespace = { "gitsigns_" },
                        },
                        condition = { is_not_neominimap },
                    },
                    {
                        sign = {
                            namespace = { "neominimap_search", "neominimap_mark" },
                            -- name = { ".*" },
                            maxwidth = 1,
                            colwidth = 1,
                        },
                        condition = { is_neominimap },
                    },
                    {
                        sign = {
                            namespace = { "neominimap_git" },
                            maxwidth = 1,
                            colwidth = 2,
                        },
                        condition = { is_neominimap },
                    },
                },
            }
        end,
    },
    {
        "stevearc/dressing.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.configs.dressing")
        end,
    },
    {
        "mrjones2014/smart-splits.nvim",
        lazy = false,
        version = ">=1.0.0",
        config = function()
            require("smart-splits").setup()
        end,
    },

    {
        "kevinhwang91/nvim-ufo",
        enabled = true,
        event = "VimEnter",
        dependencies = "kevinhwang91/promise-async",
        config = function()
            require("ufo").setup()
        end,
    },
    {
        "folke/zen-mode.nvim",
        enabled = true,
        cmd = "ZenMode",
        config = function()
            require("plugins.configs.zenmode")
        end,
    },
    {
        "folke/twilight.nvim",
        enabled = true,
        cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
        config = function()
            require("plugins.configs.twilight")
        end,
    },
    {
        "karb94/neoscroll.nvim",
        enabled = true,
        event = "VeryLazy",
        config = function()
            require("plugins.configs.neoscroll")
        end,
    },
    {
        "adelarsq/image_preview.nvim",
        event = "VeryLazy",
        config = function()
            require("image_preview").setup()
        end,
    },
    {
        "HakonHarnes/img-clip.nvim",
        enabled = true,
        event = "BufEnter",
    },
    {
        "levouh/tint.nvim",
        event = "VeryLazy",
        config = function()
            local tint = require("tint")
            local transforms = require("tint.transforms")
            tint.setup({
                transforms = {
                    transforms.tint_with_threshold(-2, "#201430", 7),
                    transforms.saturate(0.7),
                },
                tint_background_colors = true,
                highlight_ignore_patterns = {
                    "SignColumn",
                    "LineNr",
                    "CursorLine",
                    "WinSeparator",
                    "VertSplit",
                    "StatusLineNC",
                },
            })
            vim.api.nvim_create_autocmd("FocusGained", {
                callback = function()
                    tint.untint(vim.api.nvim_get_current_win())
                end,
            })
            vim.api.nvim_create_autocmd("FocusLost", {
                callback = function()
                    tint.tint(vim.api.nvim_get_current_win())
                end,
            })
        end,
    },
}
