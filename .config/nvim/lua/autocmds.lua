local api = vim.api

--Switch number type when not focus
local numberToggleGrp = api.nvim_create_augroup('NumberToggle', { clear = true})
api.nvim_create_autocmd(
  { 'BufEnter', 'FocusGained', 'InsertLeave' },
  {
    callback = function()
        vim.opt.number = true
        vim.opt.relativenumber = true
      end,
    group = numberToggleGrp
  }
)
api.nvim_create_autocmd(
  { 'BufLeave', 'FocusLost', 'InsertEnter' },
  { callback = function() vim.opt.relativenumber = false end, group = numberToggleGrp }
)
