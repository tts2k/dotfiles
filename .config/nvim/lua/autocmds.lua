local api = vim.api

-- Open float diagnostic on hover
api.nvim_create_autocmd(
  { 'CursorHold, CursorHoldI'},
  { callback = function() vim.diagnostic.open_float(nil, { focus = false }) end }
)
