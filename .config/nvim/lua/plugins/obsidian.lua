local M = {
  "epwalsh/obsidian.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "toppair/peek.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/.obsidian/personal"
      },
      {
        name = "work",
        path = "~/.obsidian/work"
      }
    },
    completion = {
      nvim_cmp = true
    }
  }
}

return M
