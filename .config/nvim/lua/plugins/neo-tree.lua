local M = {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim'
  },
  keys = {
    { "<Leader>n", "<cmd>NeoTreeFocusToggle<CR>"}
  }
}

function M.config()
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  require('neo-tree').setup({
    close_if_last_window = true,
  })
end

return M
