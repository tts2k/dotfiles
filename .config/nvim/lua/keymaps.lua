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
noremap('<Leader>ff', function() vim.lsp.buf.format() end, 'Format current buffer')

-- File manager
nnoremap('<Leader>n', '<Cmd>NvimTreeToggle<Cr>', 'Open side file manager')

-- Move a line or block
nnoremap('<A-j>', ':m .+1<CR>==', 'Move a line down')
nnoremap('<A-k>', ':m -2<CR>==', 'Move a line up')
vnoremap('<A-j>', ':m \'>+1<CR>gv=gv', 'Move a block down')
vnoremap('<A-k>', ':m \'<-2<CR>gv=gv', 'Move a block up')

-- Indent without exiting visual mode 
vnoremap('>', '>gv', 'Indent a block')
vnoremap('<', '<gv', 'Indent a block')

-- Create new line with CR without exiting normal mode
nnoremap('<CR>', 'o<ESC>', 'New line without exiting normal mode')

-- Print from yank register on insert mode Ctrl+P
imap('<C-v>', '<C-r>0', 'Paste from yank buffer')

-- U for redo
nnoremap('U', '<C-r>', 'Redo')
-- Trouble diagnostics
--local trouble = require('trouble')
--nnoremap('<Leader>xx', function() trouble.toggle() end, 'Togger trouble')
--nnoremap('<Leader>xw', function() trouble.toggle('workspace_diagnostics') end, 'Togger trouble workspace')
--nnoremap('<Leader>xd', function() trouble.toggle('document_diagnostics') end, 'Togger trouble document')
--nnoremap('<Leader>xq', function() trouble.toggle('quickfix') end, 'Togger trouble quickfix')
--nnoremap('<Leader>xl', function() trouble.toggle('loclist') end, 'Togger trouble loclist')
