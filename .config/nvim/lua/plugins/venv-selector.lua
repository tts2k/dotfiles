local M = {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-telescope/telescope.nvim',
  },
  ft = { "python" },
}

M.config = function()
  local venv_selector = require('venv-selector')

  venv_selector.setup({
    changed_venv_hooks = { "pyright", venv_selector.hooks.pyright }
  })
end

return M
