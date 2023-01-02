local M = {}

function M.setup()
  local tls_util = require('util.telescope')
  local map = require('util.map')
  local keys = {
    ['<Leader>P'] = {
      action = function() vim.lsp.buf.code_action() end,
      desc = 'Code actions'
    },
    ['<Leader>fm'] = {
      action = function() tls_util.builtin('marks') end,
      desc = 'Show list of marks'
    },
    ['<Leader>fd'] = {
      action = function() tls_util.builtin('lsp_definitions', nil, 'get_cursor') end,
      desc = 'Show definitions'
    },
    ['<Leader>fi'] = {
      action = function() tls_util.builtin('lsp_definitions', nil, 'get_cursor') end,
      desc = 'Show implementations'
    },
    ['<Leader>fr'] = {
      action = function() tls_util.builtin('references', nil, 'get_cursor') end,
      desc = 'Show references'
    },
  }

  map(keys)
end

return M
