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
local execTelescopeBuiltIn = function(cmd, opts)
  local builtin = require('telescope.builtin')
  opts = telescopeOpts(opts)
  builtin[cmd](opts)
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
vmap('<C-y>', '"+y<CR>', 'Copy to clipboard')
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
nmap('<Leader>;', function() execTelescopeBuiltIn('buffers') end, 'List buffers')
nmap('<Leader>/', function() execTelescopeBuiltIn('current_buffer_fuzzy_find') end, 'Current buffer fuzzy find')
nmap('<Leader>v', function() execTelescopeExt('file_browser', { path = '~/.config/nvim/lua' }) end, 'Open vim config directory')

-- Lsp
nnoremap('<Leader>fm', '<cmd>Telescope marks<CR>', 'Show list of marks')
nnoremap('<Leader>fd', '<cmd>Telescope lsp_definitions theme=get_cursor<CR>', 'Show definitions')
nnoremap('<Leader>fi', '<cmd>Telescope lsp_implementations theme=get_cursor<CR>', 'Show implementations')
nnoremap('<Leader>fr', '<cmd>Telescope lsp_references theme=get_cursor<CR>', 'Show references')

-- Code format
nnoremap('<Leader> ff', '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format current buffer')

-- File manager
nnoremap('<Leader>n', '<cmd>NvimTreeToggle<CR>', 'Open side file manager')
