local mode = function(str)
  return str:sub(1,1)
end

local M = {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_a = {
        { 'mode', fmt = mode }
      },
      lualine_x = {
        {
          require("noice").api.statusline.mode.get,
          cond = require("noice").api.statusline.mode.has,
        }
      }
    },
    extensions = {
      "lazy",
      "neo-tree",
      "trouble",
      "man",
    }
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/noice.nvim',
  }
}

return M
