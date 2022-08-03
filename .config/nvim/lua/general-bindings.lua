-- Fucntions
-- Change telescope layout based on screen size
local telescopeOpts = function(opts)
  local width = vim.api.nvim_win_get_width(0)

  if width > 150 then
    if opts == nil then
      opts = {}
    end
    opts.layout_strategy = 'horizontal'
  end

  return opts
end

-- Execute telescope builtins 
local execTelescopeBuiltIn = function(cmd, opts, theme)
  local builtin = require('telescope.builtin')

  -- Use theme if specified
  if (theme == nil) then
    opts = telescopeOpts(opts)
    builtin[cmd](opts)
  else
    builtin[cmd](require('telescope.themes')[theme]())
  end
end

-- Execute telescope extensions 
local execTelescopeExt = function(cmd, opts)
  local ext = require('telescope').extensions[cmd]
  opts = telescopeOpts(opts)
  ext[cmd](opts)
end

-- Leader map
vim.g.mapleader = " "

-- Select all
nmap('<Leader>a', 'ggVG', 'Select all')

-- System clipboard interaction
vmap('<C-y>', '"+y', 'Copy to clipboard')
nmap('<C-p>', '"+p', 'Paste from clipboard')

-- Window navigation
nmap('<Leader>h', '<C-w>h', 'Move to window on the left')
nmap('<Leader>j', '<C-w>j', 'Move to window below')
nmap('<Leader>k', '<C-w>k', 'Move to window above')
nmap('<Leader>l', '<C-w>l', 'Move to window on the right')

-- Maximize window
nmap('<Leader>m', '<cmd>TZFocus<CR>', 'Maximize current buffer')

-- Quickscope toggle
nmap('<Leader>q', '<plug>(QuickScopeToggle)', 'Toggle quickscope')
xmap('<Leader>q', '<plug>(QuickScopeToggle)', 'Toggle quickscope')

-- Telescope
nmap('<Leader>p', function() execTelescopeBuiltIn('fd') end, 'Find files')
nmap('<Leader>P', function() vim.lsp.buf.code_action() end, 'Code actions')
nmap('<Leader>;', function() execTelescopeBuiltIn('buffers') end, 'List buffers')
nmap('<Leader>/', function() execTelescopeBuiltIn('current_buffer_fuzzy_find') end, 'Current buffer fuzzy find')
nmap('<Leader>v', function() execTelescopeExt('file_browser', { path = '~/.config/nvim/lua' }) end, 'Open vim config directory')
nnoremap('<Leader>fm', function() execTelescopeBuiltIn('marks') end, 'Show list of marks')
nnoremap('<Leader>fd', function() execTelescopeBuiltIn('lsp_definitions', nil, 'get_cursor') end, 'Show definitions')
nnoremap('<Leader>fi', function() execTelescopeBuiltIn('lsp_implementations', nil, 'get_cursor') end, 'Show implementations')
nnoremap('<Leader>fr', function() execTelescopeBuiltIn('lsp_references', nil, 'get_cursor') end, 'Show references')

-- Code format
nnoremap('<Leader>ff', function() vim.lsp.buf.formatting() end, 'Format current buffer')

-- File manager
nnoremap('<Leader>n', function() require('nvim-tree').toggle() end, 'Open side file manager')

-- Trouble diagnostics
local trouble = require('trouble')
nnoremap('<Leader>xx', function() trouble.toggle() end, 'Togger trouble')
nnoremap('<Leader>xw', function() trouble.toggle('workspace_diagnostics') end, 'Togger trouble workspace')
nnoremap('<Leader>xd', function() trouble.toggle('document_diagnostics') end, 'Togger trouble document')
nnoremap('<Leader>xq', function() trouble.toggle('quickfix') end, 'Togger trouble quickfix')
nnoremap('<Leader>xl', function() trouble.toggle('loclist') end, 'Togger trouble loclist')
