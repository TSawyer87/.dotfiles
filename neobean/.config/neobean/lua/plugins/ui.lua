return {
  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "norcalli/nvim-colorizer.lua",
    cmd = { "ColorizerAttachToBuffer", "ColorizerReloadAllBuffers", "ColorizerDetachFromBuffer", "ColorizerToggle" },
    config = true,
  },

  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[

██╗      █████╗ ███████╗██╗   ██╗         Z
██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝      Z
██║     ███████║  ███╔╝  ╚████╔╝    z
██║     ██╔══██║ ███╔╝    ╚██╔╝   z
███████╗██║  ██║███████╗   ██║
╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝
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
              "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
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
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  },
  {
    "folke/zen-mode.nvim",
    enabled = true,
    cmd = "ZenMode",
    config = function()
      require("config.zenmode")
    end,
  },
  {
    "folke/twilight.nvim",
    enabled = true,
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    config = function()
      require("config.twilight")
    end,
  },
  {
    "karb94/neoscroll.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("config.neoscroll")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   event = "User FilePost",
  --   opts = {
  --     user_default_options = { names = false },
  --     filetypes = {
  --       "*",
  --       "!lazy",
  --     },
  --   },
  --   config = function(_, opts)
  --     require("colorizer").setup(opts)
  --
  --     -- execute colorizer as soon as possible
  --     vim.defer_fn(function()
  --       require("colorizer").attach_to_buffer(0)
  --     end, 0)
  --   end,
  -- },
}
