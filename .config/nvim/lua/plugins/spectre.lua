local M = {
  "nvim-pack/nvim-spectre",
  opts = {},
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
}

M.keys = {
  {
    '<Leader>ss',
    function()
      require('spectre').toggle()
    end,
    desc = "Toggle Spectre"
  },
  {
    '<Leader>sw',
    function()
      require('spectre').open_visual({ select_word = true })
    end,
    desc = "Search current word"
  },
  {
    '<Leader>sv',
    function()
      require('spectre').open_visual()
    end,
    desc = "Search current selection",
    mode = "v"
  },
  {
    '<Leader>sp',
    function()
      require('spectre').open_file_search({ select_word = true })
    end,
    desc = "Search word on current file"
  },
}

return M
