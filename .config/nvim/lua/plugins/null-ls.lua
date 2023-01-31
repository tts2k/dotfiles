local M = {
  "jose-elias-alvarez/null-ls.nvim",
  event = 'BufReadPre',
  disable = true
}

function M.setup(options)
  local nls = require('null-ls')
  nls.setup({
    sources = {
      nls.builtins.formatting.prismaFmt
    }
  })

  on_attach = options.on_attach
end

return M
