return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = true,
  },
  -- alpha startscreen
  -- {
  --   "goolord/alpha-nvim",
  --   lazy = false,
  --   config = function()
  --     require("plugins.configs.alpha")
  --   end,
  -- },
  {
    "folke/noice.nvim",
    event = "UiEnter",
    config = function()
      require("plugins.configs.noice")
    end,
    dependencies = { { "MunifTanjim/nui.nvim" } },
  },
  {
    "rcarriga/nvim-notify",
    config = true,
    event = "UiEnter",
  },
  -- codeium
  {
    "Exafunction/codeium.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },

  -- oil file explorer
  {
    "stevearc/oil.nvim",
    lazy = true,
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  },

  -- icons, for UI related plugins
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    cmd = "ToggleTerm",
    version = "*",
    config = function()
      require("plugins.configs.toggleterm")
    end,
  },

  -- syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "UiEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "RRethy/nvim-treesitter-textsubjects",
      "RRethy/nvim-treesitter-endwise",
      "HiPhish/rainbow-delimiters.nvim",
    },
    config = function()
      require("plugins.configs.treesitter")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
    -- ft = "markdown",
    config = function()
      require("plugins.configs.ufo")
    end,
  },

  -- buffer + tab line
  {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    config = function()
      require("plugins.configs.bufferline")
    end,
  },
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.configs.lualine")
    end,
  },

  -- we use cmp plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event, to know all the events check h-events
  -- completion , now all of these plugins are dependent on cmp, we load them after cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- cmp sources
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",

      -- snippets
      --list of default snippets
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- used for completion, annotations and signatures of Neovim apis
      { "folke/neodev.nvim", opts = {} },

      {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
      },
      -- autopairs , autocompletes ()[] etc
      {
        "windwp/nvim-autopairs",
        config = function()
          require("nvim-autopairs").setup()

          --  cmp integration
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          local cmp = require("cmp")
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },
    },
    config = function()
      require("plugins.configs.cmp")
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall" },
    config = function()
      require("mason").setup()
    end,
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("plugins.configs.lspconfig")
    end,
  },
  { "onsails/lspkind.nvim" },

  -- DAP
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "theHamsta/nvim-dap-virtual-text",
      "neovim/nvim-lspconfig",
      {
        "rcarriga/nvim-dap-ui",
        dependencies = {
          "nvim-neotest/nvim-nio",
        },
      },
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      require("plugins.configs.dap")
    end,
  },
  {
    "leoluz/nvim-dap-go",
    lazy = true,
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
  },
  {
    "jbyuki/one-small-step-for-vimkind",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    lazy = true,
    config = function()
      require("plugins.configs.vimkind")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.lint")
    end,
  },

  -- indent lines
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = function()
      require("ibl").setup({
        indent = { char = "│" },
        scope = { char = "│", highlight = "Comment" },
      })
    end,
  },
  -- undotree
  {
    "mbbill/undotree",
    lazy = true,
  },

  -- files finder etc
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "junegunn/fzf.vim",
      "echasnovski/mini.icons",
      "debugloop/telescope-undo.nvim",
      "rcarriga/nvim-notify",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "axkirillov/easypick.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      {
        "agoodshort/telescope-git-submodules.nvim",
        dependencies = "akinsho/toggleterm.nvim",
      },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
  -- Terminal buffers
  {
    "willothy/flatten.nvim",
    lazy = false,
    priority = 1001,
    config = function()
      require("plugins.configs.flatten")
    end,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    cmd = "Refactor",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "MunifTanjim/prettier.nvim",
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 },
    cmd = "GrugFar",
    keys = {
      {
        "<leader>sr",
        function()
          local grug = require("grug-far")
          local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
          grug.grug_far({
            transient = true,
            prefills = {
              filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace",
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = true,
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in Files (Spectre)" },
    },
  },
  {

    "dhananjaylatkar/notes.nvim",
    cmd = { "NotesNew", "NotesFind", "NotesGrep" },
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      root = vim.fn.expand("$HOME/notes/"),
    },
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = true,
    config = function()
      require("plugins.configs.smart-splits")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    cmd = {
      "ColorizerAttachToBuffer",
      "ColorizerReloadAllBuffers",
      "ColorizerDetachFromBuffer",
      "ColorizerToggle",
    },
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
  },
  {
    "thunder-coding/zincoxide",
    lazy = true,
    cmd = { "Z", "Zg", "Zt", "Zw" },
    opts = {
      zincoxide_cmd = "zoxide",
      complete = true,
      behaviour = "tabs",
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  },
  -- Flash enhances the built-in search functionality by showing labels
  -- at the end of each match, letting you quickly jump to a specific
  -- location.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader><tab>", group = "tabs" },
          { "<leader>c", group = "code" },
          { "<leader>f", group = "file/find" },
          { "<leader>g", group = "git" },
          { "<leader>gh", group = "hunks" },
          { "<leader>q", group = "quit/session" },
          { "<leader>s", group = "search" },
          {
            "<leader>u",
            group = "ui",
            icon = { icon = "󰙵 ", color = "cyan" },
          },
          {
            "<leader>x",
            group = "diagnostics/quickfix",
            icon = { icon = "󱖫 ", color = "green" },
          },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gs", group = "surround" },
          { "z", group = "fold" },
          {
            "<leader>b",
            group = "buffer",
            expand = function()
              return require("which-key.extras").expand.buf()
            end,
          },
          {
            "<leader>w",
            group = "windows",
            proxy = "<c-w>",
            expand = function()
              return require("which-key.extras").expand.win()
            end,
          },
          -- better descriptions
          { "gx", desc = "Open with system app" },
        },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Keymaps (which-key)",
      },
      {
        "<c-w><space>",
        function()
          require("which-key").show({ keys = "<c-w>", loop = true })
        end,
        desc = "Window Hydra Mode (which-key)",
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      if not vim.tbl_isempty(opts.defaults) then
        vim.warn(
          "which-key: opts.defaults is deprecated. Please use opts.spec instead."
        )
        wk.register(opts.defaults)
      end
    end,
  },
}
