local M = {
  'nanozuki/tabby.nvim',
}

local tab_name = function(tab)
  return string.gsub(tab, "%[..%]", "")
end

local tab_modified = function(tab)
  local wins = require("tabby.module.api").get_tab_wins(tab)
  for i, x in pairs(wins) do
    if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
      return ""
    end
  end
  return ""
end

local lsp_diag = function(buf)
  local diagnostics = vim.diagnostic.get(buf)
  local count = { 0, 0, 0, 0 }

  for _, diagnostic in ipairs(diagnostics) do
    count[diagnostic.severity] = count[diagnostic.severity] + 1
  end
  if count[1] > 0 then
    return vim.bo[buf].modified and "" or ""
  elseif count[2] > 0 then
    return vim.bo[buf].modified and "" or ""
  end
  return vim.bo[buf].modified and "" or ""
end

local function buffer_name(buf)
  if string.find(buf, "NvimTree") then
    return "NvimTree"
  end
  return buf
end

local theme = {
  fill = 'TabFill',
  head = 'TabLineHead',
  current_tab = 'TabLineSel',
  inactive_tab = 'TabLineIn',
  tab = 'TabLine',
  win = 'TabLineHead',
  tail = 'TabLineHead',
}

function M.config()
  require('tabby.tabline').use_preset('active_wins_at_tail');
end

return M
