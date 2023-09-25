local M = {
  'nanozuki/tabby.nvim',
  event = "VeryLazy"
}

function M.config()
  require('tabby.tabline').use_preset('tab_only');
end

return M
