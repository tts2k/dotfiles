local M = {}

M.signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

function M.setup()
  vim.diagnostic.config({
    severity_sort = true,
    virtual_text = false,
    signs = true,
    float = { border = "single" }
  })

  -- Disable virtual text diagnostics
  vim.diagnostic.config({
    virtual_lines = false
  })

  for type, icon in pairs(M.signs) do
    local hl = 'Diagnostic'
    vim.fn.sign_define(hl .. 'Sign' .. type, { text = icon, texthl = hl .. type })
  end
end

return M
