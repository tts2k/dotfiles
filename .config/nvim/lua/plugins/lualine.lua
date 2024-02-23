local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local config = {
  options = {
    icons_enabled = true,
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  extensions = {
    "trouble",
    "lazy",
    "neo-tree",
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Theme colors
local kanagawa = require('kanagawa.colors').setup({ theme = 'wave' })
local theme = kanagawa.theme
local palette = kanagawa.palette

local colors = {
  bg       = theme.ui.bg_dim,
  bg2      = theme.ui.bg_p1,
  fg       = theme.ui.fg_dim,
  yellow   = palette.carpYellow,
  cyan     = palette.waveAqua2,
  darkblue = palette.dragonBlue,
  green    = palette.springGreen,
  orange   = palette.surimiOrange,
  violet   = palette.oniViolet,
  magenta  = palette.sakuraPink,
  blue     = palette.crystalBlue,
  red      = palette.peachRed,
}

ins_left {
  function()
    return '▊'
  end,
  padding = { left = 0, right = 1 }, -- We don't need space beofore this
  color = { fg = colors.blue }
}

ins_left {
  -- mode component
  'mode',
  fmt = function(str)
    return ' '  .. str:sub(1, 1)
  end,
  color = function()
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }

    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

-- filetype
ins_left {
  'filetype',
  icon_only = true,
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = theme.diag.error },
    color_warn = { fg = theme.diag.warn },
    color_info = { fg = theme.diag.info }
  }
}

ins_right {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()

    if next(clients) == nil then
      return msg
    end

    local client_text = {}
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        table.insert(client_text, client.name)
      end
    end

    if #client_text > 0 then
      local result = client_text[1]

      for i = 2, #client_text do
        result = result .. ', ' .. client_text[i]
      end

      return result
    end

    return msg
  end,
  icon = '',
  color = { fg = colors.bg, bg = colors.blue },
  padding = { left = 1, right = 1 }
}

-- Add components to right sections
ins_right {
  'o:encoding',
  fmt = string.upper,
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  cond = conditions.hide_in_width,
  diff_color = {
    added = { fg = theme.vcs.added },
    modified = { fg = theme.vcs.changed },
    removed = { fg = theme.vcs.removed },
  }
}

ins_right { 'location' }

-- scrollbar
ins_right {
  function ()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  color = { fg = colors.blue, bg = colors.bg2 }
}

-- ins_right {
--   function()
--     return '▊'
--   end,
--   color = { fg = colors.magenta },
--   padding = { left = 1 },
-- }

local M = {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'folke/noice.nvim'
  },
  opts = config
}

function M.config(_, opts)
  ins_right {
    require("noice").api.statusline.mode.get,
    cond = require("noice").api.statusline.mode.has,
  }
  require('lualine').setup(opts)
end

return M
