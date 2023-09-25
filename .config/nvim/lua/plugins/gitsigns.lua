local M = {
  'lewis6991/gitsigns.nvim',
  event = 'BufReadPre',
  opts = {
    yadm = {
      enable = true
    }
  },
  keys = {
    {
      '<Leader>gs',
      '<cmd>Gitsigns stage_hunk<CR>',
      mode = {'n', 'v'},
      desc = 'Gitsigns: Stage hunk'
    },
    {
      '<Leader>gr',
      '<cmd>Gitsigns reset_hunk<CR>',
      mode = {'n', 'v'},
      desc = 'Gitsigns: Reset hunk'
    },
    {
      '<Leader>gS',
      '<cmd>Gitsigns stage_buffer<CR>',
      desc = 'Gitsigns: Stage buffer'
    },
    {
      '<Leader>gl',
      '<cmd>Gitsigns blame_line<CR>',
      desc = 'Gitsigns: Blame line'
    },
    {
      '<Leader>gR',
      '<cmd>Gitsigns reset_buffer<CR>',
      desc = 'Gitsigns: Reset buffer'
    },
    {
      '<Leader>gp',
      '<cmd>Gitsigns preview_hunk<CR>',
      desc = 'Gitsigns: Preview hunk'
    },
    {
      '<Leader>gD',
      action = '<cmd>Gitsigns toggle_deleted<CR>',
      desc = 'Gitsigns: Toggle deleted'
    },
    {
    '<Leader>gd',
      '<cmd>Gitsigns diffthis<CR>',
      desc = 'Gitsigns: Show diff'
    },
  }
}

return M
