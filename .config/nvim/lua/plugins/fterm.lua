local M = {
  "numToStr/FTerm.nvim",
  opts = {

    border = 'double',
    dimensions = {
      height = 0.9,
      width = 0.9
    }
  },
  keys = {
    {
      '<A-CR>',
      '<cmd>lua require("FTerm").toggle()<CR>',
      mode = { 'n', 't' },
      desc = 'Toggle floating terminal'
    },
  }
}

function M.config(opts)
  local fterm = require('FTerm')
  fterm.setup(opts)
end

return M
