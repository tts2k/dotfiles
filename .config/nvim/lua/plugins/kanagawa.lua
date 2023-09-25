local M = {
  'rebelot/kanagawa.nvim',
  lazy = false,
  priority = 1000
}

function M.config()
  local overrides = function(colors)
    local theme = colors.theme

    -- custom highlight groups
    return {
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
      FloatBorder = { bg = "none" },
      CmpPmenuSel = { bg = colors.sumiInk3 },
      CmpPmenu = { bg = colors.sumiInk1 },
      CmpPmenuBorder = { fg = colors.sumiInk4 },
      CmpDocs = { bg = colors.sumiInk1 },
      CmpDocsBorder = { fg = colors.sumiInk4 },
      CmpItemAbbrDeprecated = { fg = colors.fujiGray, bg = "NONE", strikethrough = true },
      CmpItemAbbrMatch = { fg = colors.crystalBlue },
      CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
      CmpItemKindVariable = { fg = colors.lightBlue },
      CmpItemKindText = { link = "CmpItemKindVariable" },
      CmpItemKindInterface = { link = "CmpItemKindVariable" },
      CmpItemKindFunction = { fg = colors.springViolet1 },
      CmpItemKindMethod = { link = "CmpItemKindFunction" },
      CmpItemKindKeyword = { fg = colors.surimiOrange },
      CmpItemKindUnit = { link = "CmpItemKindKeyword" },
      CmpItemKindProperty = { link = "CmpItemKindKeyword" },
      CmpItemKindField = { link = "CmpItemKindKeyword" }
    }
  end

  require('kanagawa').setup({
    compile = true,
    colors = {
      theme = { all = { ui = { bg_gutter = 'none' } } }
    },
    overrides = overrides
  });

  vim.cmd([[colorscheme kanagawa]])
end

return M
