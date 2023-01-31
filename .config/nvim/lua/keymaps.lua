-- Functions
-- Toggle virtual_lines/virtual_text
local toggle_virtual_lines = function()
    vim.diagnostic.config({
        virtual_lines = not vim.diagnostic.config().virtual_lines
    })
end

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

-- Code format
nnoremap('<Leader>ff', function() vim.lsp.buf.format() end, 'Format current buffer')

-- File manager
nnoremap('<Leader>n', '<Cmd>NvimTreeToggle<Cr>', 'Open side file manager')

-- Trouble diagnostics
--local trouble = require('trouble')
--nnoremap('<Leader>xx', function() trouble.toggle() end, 'Togger trouble')
--nnoremap('<Leader>xw', function() trouble.toggle('workspace_diagnostics') end, 'Togger trouble workspace')
--nnoremap('<Leader>xd', function() trouble.toggle('document_diagnostics') end, 'Togger trouble document')
--nnoremap('<Leader>xq', function() trouble.toggle('quickfix') end, 'Togger trouble quickfix')
--nnoremap('<Leader>xl', function() trouble.toggle('loclist') end, 'Togger trouble loclist')
