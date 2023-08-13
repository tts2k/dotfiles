local ui = require('util.ui')
local keys = {
  {
    '<Leader>P', function() vim.lsp.buf.code_action() end,
    desc = 'Code actions'
  },
  {
    '<Leader>fm',
    function() ui.telescope.builtin('marks') end,
    desc = 'Show list of marks'
  },
  {
    '<Leader>fd',
    function() ui.telescope.builtin('lsp_definitions', nil, 'get_cursor') end,
    desc = 'Show definitions'
  },
  {
    '<Leader>ft',
    function() ui.telescope.builtin('lsp_type_definitions', nil, 'get_cursor') end,
    desc = 'Show type definitions'
  },
  {
    '<Leader>fi',
    function() ui.telescope.builtin('lsp_implementations', nil, 'get_cursor') end,
    desc = 'Show implementations'
  },
  {
    '<Leader>fr',
    function() ui.telescope.builtin('references', nil, 'get_cursor') end,
    desc = 'Show references'
  },
}

return keys
