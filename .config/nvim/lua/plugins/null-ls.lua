local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = 'BufReadPre',
}

function M.config()
  local nls = require('null-ls')
  nls.setup({
    sources = {
      nls.builtins.formatting.prismaFmt,
      nls.builtins.formatting.black,
      nls.builtins.formatting.prettier
    }
  })
end

return M
