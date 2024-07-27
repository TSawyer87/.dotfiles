return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = true,
  },
  -- alpha startscreen
  {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
      require("plugins.configs.alpha")
    end,
  },
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
  {
    "Bekaboo/dropbar.nvim",
    event = "UiEnter",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = function()
      require("plugins.configs.dropbar")
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
        opts = {
        },
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
    lazy = true,
    config = true,
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
}
