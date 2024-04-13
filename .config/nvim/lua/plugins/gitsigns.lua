local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    yadm = {
      enable = true,
    },
  },
  keys = {
    {
      "<Leader>Gs",
      "<cmd>Gitsigns stage_hunk<CR>",
      mode = { "n", "v" },
      desc = "Gitsigns: Stage hunk",
    },
    {
      "<Leader>Gr",
      "<cmd>Gitsigns reset_hunk<CR>",
      mode = { "n", "v" },
      desc = "Gitsigns: Reset hunk",
    },
    {
      "<Leader>GS",
      "<cmd>Gitsigns stage_buffer<CR>",
      desc = "Gitsigns: Stage buffer",
    },
    {
      "<Leader>Gl",
      "<cmd>Gitsigns blame_line<CR>",
      desc = "Gitsigns: Blame line",
    },
    {
      "<Leader>GR",
      "<cmd>Gitsigns reset_buffer<CR>",
      desc = "Gitsigns: Reset buffer",
    },
    {
      "<Leader>Gp",
      "<cmd>Gitsigns preview_hunk<CR>",
      desc = "Gitsigns: Preview hunk",
    },
    {
      "<Leader>GD",
      action = "<cmd>Gitsigns toggle_deleted<CR>",
      desc = "Gitsigns: Toggle deleted",
    },
    {
      "<Leader>Gd",
      "<cmd>Gitsigns diffthis<CR>",
      desc = "Gitsigns: Show diff",
    },
  },
}

return M
