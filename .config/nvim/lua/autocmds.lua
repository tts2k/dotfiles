local api = vim.api

--Switch number type when not focus
local numberToggleGrp = api.nvim_create_augroup('NumberToggle', { clear = true})
api.nvim_create_autocmd(
    { 'BufEnter', 'FocusGained', 'InsertLeave' },
    { command = 'set number relativenumber', group = numberToggleGrp }
)
api.nvim_create_autocmd(
    { 'BufLeave', 'FocusLost', 'InsertEnter' },
    { command = 'set norelativenumber', group = numberToggleGrp }
)
