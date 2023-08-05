local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  opts = {
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
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
  },
}

function M.config(opts)
  require('telescope').setup(opts)
  require("telescope").load_extension("ui-select")
end

local tls_util = require('util.telescope')
-- Key mapping
M.keys = {
  {'<Leader>p', function() tls_util.builtin('fd') end, desc = 'Find files' },
  {'<Leader>;', function() tls_util.builtin('buffers') end, desc = 'List buffers' },
  {'<Leader>/', function() tls_util.builtin('current_buffer_fuzzy_find') end, desc = 'Current buffer fuzzy find' },
  {'<Leader>?', function() tls_util.builtin('live_grep') end, desc = 'Current directory fuzzy find' },
  {'<Leader>v', function() tls_util.ext('file_browser', { path = '~/.config/nvim/lua' }) end, desc = 'Open vim config directory' },
}

return M
