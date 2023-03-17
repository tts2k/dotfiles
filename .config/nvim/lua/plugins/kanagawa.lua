-- custom highlight groups
local M = {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000
}

function M.config()
  local default_colors = require("kanagawa.colors").setup({theme = 'wave'})
  local overrides = {
    CmpPmenuSel = { bg = default_colors.sumiInk3 },
    CmpPmenu = { bg = default_colors.sumiInk1 },
    CmpPmenuBorder = { fg = default_colors.sumiInk4 },

    CmpDocs = { bg = default_colors.sumiInk1 },
    CmpDocsBorder = { fg = default_colors.sumiInk4 },

    CmpItemAbbrDeprecated = { fg = default_colors.fujiGray, bg = "NONE", strikethrough=true },

    CmpItemAbbrMatch = { fg = default_colors.crystalBlue },
    CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

    CmpItemKindVariable = { fg = default_colors.lightBlue },
    CmpItemKindText = { link = "CmpItemKindVariable" },
    CmpItemKindInterface = { link = "CmpItemKindVariable" },

    CmpItemKindFunction = { fg = default_colors.springViolet1 },
    CmpItemKindMethod = { link = "CmpItemKindFunction" },

    CmpItemKindKeyword = { fg = default_colors.surimiOrange },
    CmpItemKindUnit = { link = "CmpItemKindKeyword" },
    CmpItemKindProperty = { link = "CmpItemKindKeyword" },
    CmpItemKindField = { link = "CmpItemKindKeyword" }
  }

  require('kanagawa').setup({
    colors = {
      theme = { all = { ui = { bg_gutter = 'none' } }}
    },
    overrides = function(_)
      return overrides
    end
  });

  vim.cmd([[colorscheme kanagawa]])
end

return M
