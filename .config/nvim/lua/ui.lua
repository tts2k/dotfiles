require('indent_blankline').setup {
  show_current_context = true,
  filetype_exclude = { "dashboard", "help" },
  char = "¦",
  context_char = "│",
  context_patterns = {
   "class",
    "^func",
    "method",
    "^if",
    "while",
    "for",
    "with",
    "try",
    "except",
    "arguments",
    "argument_list",
    "object",
    "dictionary",
    "element",
    "table",
    "tuple",
    "do_block",
    "^.*_expression",
    "let_declaration",
    "block",
    "^.*_block",
  }
}

-- Telescope
require('telescope').setup({
  defaults = {
  layout_strategy = 'vertical',
  color_devicons = true,
  path_display = { "truncate" },
  mappings = {
    n = {
      ['<C-d>'] = require('telescope.actions').delete_buffer,
    },
    i = {
      ['<C-h>'] = 'which_key',
      ['<C-d>'] = require('telescope.actions').delete_buffer,
    }
  }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    file_browser = {
      hijack_netrw = true
    },
    project = {
      base_dirs = {
        '~/projects/'
      }
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown()
    }
  }
})
require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')
require('telescope').load_extension('ui-select')

-- Dashboard
local db = require('dashboard')
db.hide_statusline = false
db.custom_header = {
  [[ ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ]],
  [[ ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ]],
  [[ ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ]],
  [[ ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ]],
  [[ ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ]],
  [[ ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ]],
  [[ ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ]],
  [[ ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ]],
  [[ ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ]],
  [[ ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ]],
  [[ ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ]],
  [[ ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ]],
  [[ ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ]],
  [[ ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ]],
  [[                                ]],
  [[                                ]],
  [[                                ]],
}
db.custom_center = {
  {
    icon = ' ',
    desc = 'Recently latest session                 ',
    shortcut = 'SPC s l',
    action ='SessionLoad'
  },
  {
    icon = ' ',
    desc = 'Recently opened files                   ',
    action =  'DashboardFindHistory',
    shortcut = 'SPC f h'
  },
  {
    icon = ' ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'
  },
  {
    icon = ' ',
    desc ='File Browser                            ',
    action =  'Telescope file_browser',
    shortcut = 'SPC f b'
  },
  {
    icon = ' ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f w'
  },
}

-- Lsp diagnostic icons
vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'DiagnosticError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'DiagnosticWarn' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'DiagnosticInfo' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'DiagnosticHint' }
)

-- One-line plugins
require('lualine').setup()
require('nvim-tree').setup { view = { relativenumber = true }}
require('gitsigns').setup()
require('which-key').setup()
