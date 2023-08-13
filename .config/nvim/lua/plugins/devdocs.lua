local M = {
  "luckasRanarison/nvim-devdocs",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    previewer_cmd = 'glow',
    cmd_args = { '-s', 'dark', '-w', '80' },
    ensure_installed = {
      'html',
      'typescript',
      'javascript',
      'node-18_lts',
      'go',
      'lua-5.4',
      'tailwindcss',
      'bash',
      'git',
      'postgresql-15',
      'svelte'
    }
  }
}

local docsByFt = {
  javascript = { 'javascript', 'node-18_lts' },
  typescript = { 'typescript', 'node-18_lts' },
  html = { 'html', 'tailwindcss' },
  svelte = { 'svelte', 'tailwindcss' },
  lua = 'lua-5.4',
  sql = 'postgresql-15'
}

local showDocsMenu = function(docs)
  local ui = require('util.ui')
  local items = {}

  for i = 1, #docs do
    table.insert(items, { label = docs[i] })
  end

  ui.nui.showNuiMenu(items, {
    on_submit = function(item)
      vim.cmd('DevdocsOpen ' .. item.text)
    end
  }, {
    border = {
      text = {
        top = "Choose a doc",
      }
    }
  })
end

local openDocsCurrentFt = function()
  local ft = vim.bo.ft

  local docs = docsByFt[ft]

  -- Custom name
  if type(docs) == 'string' then
    vim.cmd('DevdocsOpen ' .. docs)
    return
  end

  -- Custom set of docs
  if type(docs) == 'table' then
    showDocsMenu(docs)
    return
  end

  -- No custom ft
  vim.cmd('DevdocsOpen ' .. ft)
end

M.keys = {
  {
    "<Leader>dd",
    function() openDocsCurrentFt() end,
    desc = "Open documentation of current buffer filetype"
  },
  {
    "<Leader>do",
    "<cmd>DevdocsOpen<CR>",
    desc = 'Open documentation'
  },
  {
    "<Leader>df",
    "<cmd>DevdocsOpenFloat<CR>",
    desc = 'Open documentation floated'
  },
}

return M
