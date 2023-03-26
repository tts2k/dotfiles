local tls_util = require('util.telescope')
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
  ['<Leader>ft'] = {
    action = function() tls_util.builtin('lsp_type_definitions', nil, 'get_cursor') end,
    desc = 'Show type definitions'
  },
  ['<Leader>fi'] = {
    action = function() tls_util.builtin('lsp_implementations', nil, 'get_cursor') end,
    desc = 'Show implementations'
  },
  ['<Leader>fr'] = {
    action = function() tls_util.builtin('references', nil, 'get_cursor') end,
    desc = 'Show references'
  },
}

return keys
