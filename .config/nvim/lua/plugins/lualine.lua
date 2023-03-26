local M = {
  'nvim-lualine/lualine.nvim',
  opts = {
    sections = {
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
        }
      }
    }
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/noice.nvim',
  }
}
return M
