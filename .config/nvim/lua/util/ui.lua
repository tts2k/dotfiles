local M = {
  telescope = require('util.telescope')
}
---@param data { label: string, opts: table }[]
---@param callbacks { on_submit: fun(item: { text: string }), on_close: fun() }
---@param opts table
local showNuiMenu = function(data, callbacks, opts)
  local Menu = require('nui.menu')
  local menu_items = {}

  for d = 1, #data do
    table.insert(menu_items, Menu.item(data[d].label, data[d].opts))
  end

  local default_opts = {
    position = "50%",
    size = {
      width = 50,
      height = 5,
    },
    border = {
      style = "single",
      text = {
        top = "[Choose-an-Element]",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }

  default_opts = vim.tbl_deep_extend('force', default_opts, opts or {})

  local menu = Menu(default_opts,
    {
      lines = menu_items,
      keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
      },
      on_close = callbacks.on_close,
      on_submit = callbacks.on_submit,
    }
  )

  menu:mount()
end

M.nui = { showNuiMenu = showNuiMenu }

return M
