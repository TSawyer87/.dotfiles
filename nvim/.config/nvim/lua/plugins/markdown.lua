return { {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown",            -- Only needed if you have another plugin named markdown.nvim
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- Mandatory
    "nvim-tree/nvim-web-devicons",     -- Optional but recommended
  },
  config = function()
    require("render-markdown").setup({})
  end,
},
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown", -- or 'event = "VeryLazy"'
    opts = {
      -- configuration here or empty for defaults
    },
  }
}
