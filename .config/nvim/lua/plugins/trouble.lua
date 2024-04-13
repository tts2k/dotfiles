local M = {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
  keys = {
    {
      "<Leader>xx",
      "<cmd>TroubleToggle<CR>",
      desc = "Toggle trouble",
    },
    {
      "<Leader>xw",
      "<cmd>TroubleToggle workspace_diagnostics<CR>",
      desc = "Toggle trouble workspace",
    },
    {
      "<Leader>xd",
      "<cmd>TroubleToggle document_diagnostics<CR>",
      desc = "Toggle trouble document",
    },
    {
      "<Leader>xq",
      "<cmd>TroubleToggle quickfix<CR>",
      desc = "Toggle trouble quickfix",
    },
    {
      "<Leader>xl",
      "<cmd>TroubleToggle loclist<CR>",
      desc = "Toggle trouble loclist",
    },
  },
}

return M
