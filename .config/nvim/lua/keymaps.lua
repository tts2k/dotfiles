-- Select all
local keys = {
  {
    "<ESC>",
    "<ESC><cmd>noh<CR>"
  },
  {
    '<C-y>',
    '"+y',
    desc = 'Copy to clipboard',
    mode = "v"
  },
  {
    '<C-p>',
    '"+p',
    desc = 'Paste from clipboard'
  },
  {
    '<C-v>',
    '<C-r>0',
    desc = 'Paste from yank buffer',
    mode = "i"
  },
  {
    '<C-h>',
    '<C-w>h',
    desc = 'Move to window on the left'
  },
  {
    '<C-j>',
    '<C-w>j',
    desc = 'Move to window below'
  },
  {
    '<C-k>',
    '<C-w>k',
    desc = 'Move to window above'
  },
  {
    '<C-l>',
    '<C-w>l',
    desc = 'Move to window on the right'
  },
  {
    '<CR>',
    'o<ESC>',
    desc = 'New line without exiting normal mode'
  },
}

require('util.map').map(keys)
