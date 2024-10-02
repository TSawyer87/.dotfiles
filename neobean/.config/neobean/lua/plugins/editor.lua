return {
  -- UTILS
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "UiEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-textsubjects",
      "RRethy/nvim-treesitter-endwise",
    },
    config = function()
      require("config.treesitter")
    end,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
    config = function()
      require("config.folds")
    end,
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
          { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
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
        vim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
        wk.register(opts.defaults)
      end
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
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
      require("config.dap")
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
  },
}
