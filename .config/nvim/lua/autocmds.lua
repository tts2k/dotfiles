local api = vim.api
local augroup = api.nvim_create_augroup("numbertoggle", {})

-- Open float diagnostic on hover
api.nvim_create_autocmd(
  { 'CursorHold, CursorHoldI' },
  { callback = function() vim.diagnostic.open_float(nil, { focus = false }) end }
)

api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd "redraw"
    end
  end,
})
