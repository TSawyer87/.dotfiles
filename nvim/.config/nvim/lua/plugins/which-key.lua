return {
  "folke/which-key.nvim",
  -- event = "VimEnter",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        { "<leader>c", group = "[C]ode" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "[G]it" },
        { "<leader>l", group = "[L]azygit" },
        { "<leader>gh", group = "[h]unks" },
        { "<leader>q", group = "[Q]uit/session" },
        { "<leader>/", group = "comment/uncomment" },
        { "<leader>n", group = "Obsidia[n]" },
        { "<leader>s", group = "[S]earch" },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
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
}
