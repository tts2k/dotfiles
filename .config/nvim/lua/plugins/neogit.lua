local M = {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    {
      "sindrets/diffview.nvim",
      opts = {},
    },
  },
  opts = {},
  keys = {
    {
      "<Leader>gg",
      "<cmd>Neogit<CR>",
      desc = "Neogit",
    },
    {
      "<Leader>gc",
      "<cmd>Neogit commit<CR>",
      desc = "Neogit: commit",
    },
  },
}

return M
