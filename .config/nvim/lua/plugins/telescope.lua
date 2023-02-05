local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
}

function M.config()
  require('telescope').setup {
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
  }
  -- Keymapping
  local tls_util = require('util.telescope')
  local map = require('util.map')
  local keys = {
    ['<Leader>p'] = {
      action = function() tls_util.builtin('fd') end,
      desc = 'Find files'
    },
    ['<Leader>;'] = {
      action = function() tls_util.builtin('buffers') end,
      desc = 'List buffers'
    },
    ['<Leader>/'] = {
      action = function() tls_util.builtin('current_buffer_fuzzy_find') end,
      desc = 'Current buffer fuzzy find'
    },
    ['<Leader>?'] = {
      action = function() tls_util.builtin('live_grep') end,
      desc = 'Current directory fuzzy find'
    },
    ['<Leader>v'] = {
      action = function() tls_util.ext('file_browser', { path = '~/.config/nvim/lua' }) end,
      desc = 'Open vim config directory'
    },
  }

  map(keys)
end

return M
