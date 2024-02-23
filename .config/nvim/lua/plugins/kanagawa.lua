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
      -- Telescope
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

      -- Floating window
      FloatBorder = { bg = "none" },
      NormalFloat = { bg = theme.ui.bg_m1, blend = vim.o.pumblend },

      -- Illuminate
      IlluminatedWordText = { link = "Visual" },
      IlluminatedWordRead = { link = "Visual" },
      IlluminatedWordWrite = { link = "Visual" },
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
