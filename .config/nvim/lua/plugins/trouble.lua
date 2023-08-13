local M = {
  "folke/trouble.nvim",
  opts = {},
  event = "BufEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      '<Leader>xx', '<cmd>TroubleToggle workspace_diagnostics<cr>',
      desc = 'Togger trouble workspace'
    },
    {
      '<Leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>',
      desc = 'Toggle trouble document'
    },
    {
      '<Leader>xq', '<cmd>TroubleToggle quickfix<cr>',
      desc = 'Togger trouble quickfix'
    },
    {
      '<Leader>xl', '<cmd>TroubleToggle loclist<cr>',
      desc = 'Togger trouble loclist'
    },
  }
}

return M
